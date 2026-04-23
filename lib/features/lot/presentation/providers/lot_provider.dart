import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/lot.dart';
import '../../domain/repositories/lot_repository.dart';
import '../../domain/usecases/get_lots.dart';
import '../../domain/usecases/create_lot.dart';
import '../../domain/usecases/update_lot.dart';
import '../../domain/usecases/delete_lot.dart';
import '../../domain/usecases/import_lots.dart';

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
    bool clearError = false,
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
    );
  }
}

class LotNotifier extends StateNotifier<LotState> {
  final GetLotsUseCase _getLotsUseCase;
  final CreateLotUseCase _createLotUseCase;
  final UpdateLotUseCase _updateLotUseCase;
  final DeleteLotUseCase _deleteLotUseCase;
  final ImportLotsUseCase _importLotsUseCase;

  LotNotifier({
    required GetLotsUseCase getLotsUseCase,
    required CreateLotUseCase createLotUseCase,
    required UpdateLotUseCase updateLotUseCase,
    required DeleteLotUseCase deleteLotUseCase,
    required ImportLotsUseCase importLotsUseCase,
  })  : _getLotsUseCase = getLotsUseCase,
        _createLotUseCase = createLotUseCase,
        _updateLotUseCase = updateLotUseCase,
        _deleteLotUseCase = deleteLotUseCase,
        _importLotsUseCase = importLotsUseCase,
        super(const LotState());

  Future<void> fetchLots({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(currentPage: 1, clearError: true);
    }

    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _getLotsUseCase.call(GetLotsParams(
      page: state.currentPage,
      pageSize: state.pageSize,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
    ));

    if (result.isSuccess && result.data != null) {
      state = state.copyWith(
        lots: result.data!,
        isLoading: false,
        totalCount: result.data!.length, // In real app, get total count from API
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error ?? 'Failed to fetch lots',
      );
    }
  }

  Future<void> createLot({
    required String code,
    required String description,
    required String createdBy,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);

    final result = await _createLotUseCase.call(CreateLotParams(
      code: code,
      description: description,
      createdBy: createdBy,
    ));

    if (result.isSuccess && result.data != null) {
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
    String? editedBy,
  }) async {
    state = state.copyWith(isUpdating: true, clearError: true);

    final result = await _updateLotUseCase.call(UpdateLotParams(
      id: id,
      code: code,
      description: description,
      editedBy: editedBy,
    ));

    if (result.isSuccess && result.data != null) {
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
    required String filePath,
    bool replace = false,
  }) async {
    state = state.copyWith(isImporting: true, clearError: true);

    final result = await _importLotsUseCase.call(ImportLotsParams(
      filePath: filePath,
      replace: replace,
    ));

    if (result.isSuccess && result.data != null) {
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
}

// Providers
final lotRepositoryProvider = Provider<LotRepository>((ref) {
  // In a real app, inject the actual repository implementation
  throw UnimplementedError('LotRepository not implemented');
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

final lotProvider = StateNotifierProvider<LotNotifier, LotState>((ref) {
  return LotNotifier(
    getLotsUseCase: ref.watch(getLotsUseCaseProvider),
    createLotUseCase: ref.watch(createLotUseCaseProvider),
    updateLotUseCase: ref.watch(updateLotUseCaseProvider),
    deleteLotUseCase: ref.watch(deleteLotUseCaseProvider),
    importLotsUseCase: ref.watch(importLotsUseCaseProvider),
  );
});
