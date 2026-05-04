import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/data/datasources/lot_remote_datasource.dart';
import 'package:template_catra_mobile/features/lot/data/repositories/lot_repository_impl.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/get_lots.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/create_lot.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/update_lot.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/delete_lot.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/import_lots.dart';
import 'package:template_catra_mobile/features/lot/domain/usecases/download_template.dart';

class LotState {
  final List<Lot> lots;
  final bool isLoading;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;
  final bool isImporting;
  final String? error;
  final int currentPage;
  final int pageSize;
  final int totalCount;
  final String searchQuery;
  final ImportResult? importResult;

  const LotState({
    this.lots = const [],
    this.isLoading = false,
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
    this.isImporting = false,
    this.error,
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalCount = 0,
    this.searchQuery = '',
    this.importResult,
  });

  LotState copyWith({
    List<Lot>? lots,
    bool? isLoading,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
    bool? isImporting,
    String? error,
    int? currentPage,
    int? pageSize,
    int? totalCount,
    String? searchQuery,
    ImportResult? importResult,
    bool clearError = false,
    bool clearImportResult = false,
  }) {
    return LotState(
      lots: lots ?? this.lots,
      isLoading: isLoading ?? this.isLoading,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
      isImporting: isImporting ?? this.isImporting,
      error: clearError ? null : (error ?? this.error),
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      totalCount: totalCount ?? this.totalCount,
      searchQuery: searchQuery ?? this.searchQuery,
      importResult: clearImportResult ? null : importResult ?? this.importResult,
    );
  }
}

class LotNotifier extends StateNotifier<LotState> {
  final GetLotsUseCase _getLotsUseCase;
  final CreateLotUseCase _createLotUseCase;
  final UpdateLotUseCase _updateLotUseCase;
  final DeleteLotUseCase _deleteLotUseCase;
  final ImportLotsUseCase _importLotsUseCase;
  final DownloadTemplateUseCase _downloadTemplateUseCase;

  LotNotifier({
    required GetLotsUseCase getLotsUseCase,
    required CreateLotUseCase createLotUseCase,
    required UpdateLotUseCase updateLotUseCase,
    required DeleteLotUseCase deleteLotUseCase,
    required ImportLotsUseCase importLotsUseCase,
    required DownloadTemplateUseCase downloadTemplateUseCase,
  })  : _getLotsUseCase = getLotsUseCase,
        _createLotUseCase = createLotUseCase,
        _updateLotUseCase = updateLotUseCase,
        _deleteLotUseCase = deleteLotUseCase,
        _importLotsUseCase = importLotsUseCase,
        _downloadTemplateUseCase = downloadTemplateUseCase,
        super(const LotState());

  Future<void> fetchLots({int page = 0,  bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(currentPage: 1, clearError: true);
    }
    if(page > 0) {
      state = state.copyWith(currentPage: page, clearError: true);
    }
    state = state.copyWith(isLoading: true, clearError: true);

    final Result<PaginatedResult<Lot>> result = await _getLotsUseCase.call(GetLotsParams(
      page: state.currentPage,
      pageSize: state.pageSize,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
    ));

    if (result.isSuccess && result.data != null) {
      state = state.copyWith(
        lots: result.data!.items,
        isLoading: false,
        totalCount: result.data!.total,
        currentPage: result.data!.page,
        pageSize: result.data!.perPage,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error ?? 'Failed to fetch lots',
      );
    }
  }

  void clearImportResult() {
    state = state.copyWith(clearImportResult: true);
  }
  
  Future<void> createLot({
    required String code,
    required String description,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);

    final result = await _createLotUseCase.call(CreateLotParams(
      code: code,
      description: description,
    ));

    if (result.isSuccess) {
      // Refresh the list
      await fetchLots(refresh: true);
    } else {
      state = state.copyWith(
        isCreating: false,
        error: result.error ?? 'Failed to create lot',
      );
    }
  }

  Future<void> updateLot({
    required int id,
    String? code,
    String? description,
  }) async {
    state = state.copyWith(isUpdating: true, clearError: true);

    final result = await _updateLotUseCase.call(UpdateLotParams(
      id: id,
      code: code,
      description: description,
    ));

    if (result.isSuccess) {
      // Refresh the list
      await fetchLots(refresh: true);
    } else {
      state = state.copyWith(
        isUpdating: false,
        error: result.error ?? 'Failed to update lot',
      );
    }
  }

  Future<void> deleteLot(int id) async {
    state = state.copyWith(isDeleting: true, clearError: true);

    final result = await _deleteLotUseCase.call(id);

    if (result.isSuccess) {
      // Refresh the list
      await fetchLots(refresh: true);
    } else {
      state = state.copyWith(
        isDeleting: false,
        error: result.error ?? 'Failed to delete lot',
      );
    }
  }

  Future<void> importLots({
    required PlatformFile file,
    bool replace = false,
  }) async {
    state = state.copyWith(isImporting: true, clearError: true);

    final result = await _importLotsUseCase.call(ImportLotsParams(
      file: file,
      replace: replace,
    ));

    if (result.isSuccess) {
      // Refresh the list
      await fetchLots(refresh: true);
    } else {
      state = state.copyWith(
        isImporting: false,
        error: result.error ?? 'Failed to import lots',
      );
    }
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    fetchLots(refresh: true);
  }

  void nextPage() {
    state = state.copyWith(currentPage: state.currentPage + 1);
    fetchLots();
  }

  void previousPage() {
    if (state.currentPage > 1) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      fetchLots();
    }
  }

  void setPageSize(int newSize) {
    state = state.copyWith(pageSize: newSize, currentPage: 1);
    fetchLots(refresh: true);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  Future<void> downloadTemplate() async {
    try {
      await _downloadTemplateUseCase.call();
    } catch (e) {
      // Re-throw the error to be handled by the UI
      rethrow;
    }
  }
}

// Providers
final lotRepositoryProvider = Provider<LotRepository>((ref) {
  return LotRepositoryImpl(remoteDataSource: ref.watch(lotRemoteDataSourceProvider));
});

final getLotsUseCaseProvider = Provider<GetLotsUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return GetLotsUseCase(repository: repository);
});

final createLotUseCaseProvider = Provider<CreateLotUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return CreateLotUseCase(repository: repository);
});

final updateLotUseCaseProvider = Provider<UpdateLotUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return UpdateLotUseCase(repository: repository);
});

final deleteLotUseCaseProvider = Provider<DeleteLotUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return DeleteLotUseCase(repository: repository);
});

final importLotsUseCaseProvider = Provider<ImportLotsUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return ImportLotsUseCase(repository: repository);
});

final downloadTemplateUseCaseProvider = Provider<DownloadTemplateUseCase>((ref) {
  final repository = ref.watch(lotRepositoryProvider);
  return DownloadTemplateUseCase(repository: repository);
});

final lotProvider = StateNotifierProvider<LotNotifier, LotState>((ref) {
  return LotNotifier(
    getLotsUseCase: ref.watch(getLotsUseCaseProvider),
    createLotUseCase: ref.watch(createLotUseCaseProvider),
    updateLotUseCase: ref.watch(updateLotUseCaseProvider),
    deleteLotUseCase: ref.watch(deleteLotUseCaseProvider),
    importLotsUseCase: ref.watch(importLotsUseCaseProvider),
    downloadTemplateUseCase: ref.watch(downloadTemplateUseCaseProvider),
  );
});
