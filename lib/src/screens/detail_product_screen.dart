part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
              listener: (context, state) {
            if (state is ProductDetailIsFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          }, builder: (context, state) {
            if (state is ProductDetailIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductDetailIsSuccess) {
              return DetailProductWidget(detailProduct: state.model);
            }
            return Container();
            // FutureBuilder<http.Response>(
            //     future: http
            //         .get(Uri.parse("https://fakestoreapi.com/products/$productId")),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       if (snapshot.hasData) {
            //         final detailProduct =
            //             detailProductModelFromJson(snapshot.data!.body);
            //         return DetailProductWidget(
            //           detailProduct: detailProduct,
            //         );
            //       }
            //       return Container();
            //     }),
          }),
        ));
  }
}
