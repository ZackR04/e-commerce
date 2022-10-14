part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  final int productId;

  const DetailProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<http.Response>(
            future: http
                .get(Uri.parse("https://fakestoreapi.com/products/$productId")),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final detailProduct =
                    detailProductModelFromJson(snapshot.data!.body);
                return DetailProductWidget(
                  detailProduct: detailProduct,
                );
              }
              return Container();
            }),
      ),
    );
  }
}
