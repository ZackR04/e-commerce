part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailIsLoading extends ProductDetailState {}

class ProductDetailIsFailed extends ProductDetailState {
  final String message;

  ProductDetailIsFailed(this.message);
}

class ProductDetailIsSuccess extends ProductDetailState {
  final DetailProductModel model;

  ProductDetailIsSuccess(this.model);
}
