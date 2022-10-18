part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductIsLoading extends ProductState {}

class ProductIsSuccess extends ProductState {
  final List<ProductModel> data;

  ProductIsSuccess(this.data);
}

class ProductIsFailed extends ProductState {
  final String message;

  ProductIsFailed(this.message);
}
