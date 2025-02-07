part of 'products_cubit.dart';


@freezed
class ProductsState<T> with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = Loading;
  const factory ProductsState.success(List<ProductListResponse> products) =
      Success;
  const factory ProductsState.error({required String message}) = Error;
}
