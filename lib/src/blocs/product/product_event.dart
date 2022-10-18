part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchProductFromAPI extends ProductEvent {}
