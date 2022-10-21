import 'package:bloc/bloc.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/services.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<FetchProductDetail>((event, emit) async {
      emit(ProductDetailIsLoading());

      final result = await ProductService().fetchProductDetail(event.id);

      if (result.data != null) {
        final data = detailProductModelFromJson(result.data);
        emit(ProductDetailIsSuccess(data));
      } else {
        emit(ProductDetailIsFailed(result.message));
      }
    });
  }
}
