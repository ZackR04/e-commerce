part of 'widgets.dart';

class DetailProductWidget extends StatelessWidget {
  final DetailProductModel detailProduct;

  const DetailProductWidget({super.key, required this.detailProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: detailProduct.id!,
              child: Image.network(detailProduct.image!)),
          const SizedBox(
            height: 24,
          ),
          Text(detailProduct.title!),
          Text('Rp.${detailProduct.price!}'),
          Text(detailProduct.description!),
        ],
      ),
    );
  }
}
