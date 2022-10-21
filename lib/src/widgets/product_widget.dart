part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductDetailBloc>(context)
            .add(FetchProductDetail(product.id!));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailProductScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                  tag: product.id!,
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.network(product.image!))),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text(
                product.title!,
                style: const TextStyle(fontSize: 12, color: warnaElite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text('\$ ${product.price!}',
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: warnaMedium)),
            )
            // Expanded(
            //   child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [

            //         ],
            //       )
            //     ),
            // )
          ],
        ),
      ),
    );
  }
}
