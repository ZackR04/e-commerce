import 'package:bloc/bloc.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/services.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProductFromAPI>((event, emit) async {
      emit(ProductIsLoading());

      final result = await ProductService().fetchProductList();
      if (result.data != null) {
        final data = productModelFromJson(result.data);
        emit(ProductIsSuccess(data));
      } else {
        emit(ProductIsFailed(result.message));
      }
    });
  }
}
