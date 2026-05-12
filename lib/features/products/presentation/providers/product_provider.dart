import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/utils/api_error_helper.dart';
import 'package:template_catra_mobile/features/products/data/datasources/product_remote_datasource.dart';
import 'package:template_catra_mobile/features/products/data/repositories/product_repository_impl.dart';
import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/get_products.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/create_product.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/update_product.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/delete_product.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/import_products.dart';
import 'package:template_catra_mobile/features/products/domain/usecases/download_template.dart';

class ProductState {
  final List<Product> products;
  final List<Product> childProducts;
  final String? parentId;
  final bool isLoading;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;
  final bool isImporting;
  final String? error;
  final ErrorType? errorType;
  final int currentPage;
  final int pageSize;
  final int totalCount;
  final String searchQuery;
  final ImportResult? importResult;

  const ProductState({
    this.products = const [],
    this.childProducts = const [],
    this.parentId = '0',
    this.isLoading = false,
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
    this.isImporting = false,
    this.error,
    this.errorType,
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalCount = 0,
    this.searchQuery = '',
    this.importResult,
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? childProducts,
    String? parentId,
    bool? isLoading,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
    bool? isImporting,
    String? error,
    ErrorType? errorType,
    int? currentPage,
    int? pageSize,
    int? totalCount,
    String? searchQuery,
    ImportResult? importResult,
    bool clearError = false,
    bool clearImportResult = false,
  }) {
    return ProductState(
      products: products ?? this.products,
      childProducts: childProducts ?? this.childProducts,
      parentId: parentId ?? this.parentId,
      isLoading: isLoading ?? this.isLoading,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
      isImporting: isImporting ?? this.isImporting,
      error: clearError ? null : (error ?? this.error),
      errorType: clearError ? null : (errorType ?? this.errorType),
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      totalCount: totalCount ?? this.totalCount,
      searchQuery: searchQuery ?? this.searchQuery,
      importResult: clearImportResult ? null : importResult ?? this.importResult,
    );
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier({
    required this.getProductsUseCase,
    required this.createProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
    required this.importProductsUseCase,
    required this.downloadTemplateUseCase,
  }) : super(const ProductState());

  final GetProductsUseCase getProductsUseCase;
  final CreateProductUseCase createProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final ImportProductsUseCase importProductsUseCase;
  final DownloadTemplateUseCase downloadTemplateUseCase;

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setParentId(String? parentId) {
    state = state.copyWith(parentId: parentId);
    fetchProducts(refresh: true);
  }

  Future<void> fetchProducts({
    int page = 1,
    bool refresh = false,
  }) async {
    if (!mounted) return;
    if (refresh) {
      state = state.copyWith(currentPage: 1, clearError: true);
    }
    state = state.copyWith(isLoading: true, clearError: true);
    
    final result = await getProductsUseCase(
      GetProductsParams(
        page: page,
        pageSize: state.pageSize,
        search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
        parentId: state.parentId,
      ),
    );
if (!mounted) return;
    if (result.isSuccess) {
      final paginatedResult = result.data!;
      state = state.copyWith(
        isLoading: false,
        currentPage: paginatedResult.page,
        pageSize: paginatedResult.perPage,
        totalCount: paginatedResult.total,
      );
      if(state.parentId != null && state.parentId != '0') {
        state = state.copyWith(childProducts: paginatedResult.items);
      } else {
        state = state.copyWith(products: paginatedResult.items);
      }
    } else {
      state = state.copyWith(isLoading: false, error: result.error, errorType: result.errorType);
    }
  }

  Future<bool> createProduct({
    required String code,
    required String description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
  }) async {
    state = state.copyWith(isCreating: true, error: null);
    if (!mounted) return false;
    final result = await createProductUseCase(
      CreateProductParams(
        code: code,
        description: description,
        parentId: parentId,
        wWin: wWin,
        wMax: wMax,
        dinhmuc: dinhmuc,
        note: note,
      ),
    );

    if (!mounted) return false;
    if (result.isSuccess) {
      state = state.copyWith(isCreating: false);
      // Refresh: list
      fetchProducts(refresh: true);
    } else {
      state = state.copyWith(isCreating: false, error: result.error);
    }
    return result.isSuccess;
  }

  Future<bool> updateProduct({
    required int id,
    String? code,
    String? description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
    String? editedBy,
  }) async {
    state = state.copyWith(isUpdating: true, error: null);
    if (!mounted) return false;
    final result = await updateProductUseCase(
      UpdateProductParams(
        id: id,
        code: code,
        description: description,
        parentId: parentId,
        wWin: wWin,
        wMax: wMax,
        dinhmuc: dinhmuc,
        note: note,
        editedBy: editedBy,
      ),
    );
if (!mounted) return false;
    if (result.isSuccess) {
      state = state.copyWith(isUpdating: false);
      // Refresh: list
      fetchProducts(refresh: true);
    } else {
      state = state.copyWith(isUpdating: false, error: result.error);
    }
    return result.isSuccess;
  }

  Future<bool> deleteProduct(int id) async {
    state = state.copyWith(isDeleting: true, error: null);
    
    final result = await deleteProductUseCase(
      DeleteProductParams(id: id),
    );

    if (!mounted) return false;
    if (result.isSuccess) {
      state = state.copyWith(isDeleting: false);
      // Refresh: list
      fetchProducts(refresh: true);
    } else {
      state = state.copyWith(isDeleting: false, error: result.error);
    }
    return result.isSuccess;
  }

  Future<bool> importProducts({
    required PlatformFile file,
    bool replace = false,
  }) async {
    state = state.copyWith(isImporting: true, error: null);
    
    final result = await importProductsUseCase(
      ImportProductsParams(
        file: file,
        replace: replace,
      ),
    );

    if (!mounted) return false;
    if (result.isSuccess) {
      state = state.copyWith(
        isImporting: false,
        importResult: result.data,
      );
      // Refresh: list
      fetchProducts(refresh: true);
    } else {
      state = state.copyWith(isImporting: false, error: result.error);
    }
    return result.isSuccess;
  }

  Future<bool> downloadTemplate() async {
    final result = await downloadTemplateUseCase();
    if (!mounted) return false;
    return result.isSuccess;
  }

  void setPageSize(int newSize) {
    state = state.copyWith(pageSize: newSize, currentPage: 1);
    fetchProducts(refresh: true);
  }
}

// Provider cho repository
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    remoteDataSource: ref.watch(productRemoteDataSourceProvider),
  );
});

// Provider cho các use case
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUseCase(repository: repository);
});

final createProductUseCaseProvider = Provider<CreateProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return CreateProductUseCase(repository: repository);
});

final updateProductUseCaseProvider = Provider<UpdateProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return UpdateProductUseCase(repository: repository);
});

final deleteProductUseCaseProvider = Provider<DeleteProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return DeleteProductUseCase(repository: repository);
});

final importProductsUseCaseProvider = Provider<ImportProductsUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ImportProductsUseCase(repository: repository);
});

final downloadTemplateUseCaseProvider = Provider<DownloadTemplateUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return DownloadTemplateUseCase(repository: repository);
});

// Main provider
final productProvider = StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(
    getProductsUseCase: ref.watch(getProductsUseCaseProvider),
    createProductUseCase: ref.watch(createProductUseCaseProvider),
    updateProductUseCase: ref.watch(updateProductUseCaseProvider),
    deleteProductUseCase: ref.watch(deleteProductUseCaseProvider),
    importProductsUseCase: ref.watch(importProductsUseCaseProvider),
    downloadTemplateUseCase: ref.watch(downloadTemplateUseCaseProvider),
  );
});
