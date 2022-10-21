part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class FetchProductDetail extends ProductDetailEvent {
  final int id;

  FetchProductDetail(this.id);
}
