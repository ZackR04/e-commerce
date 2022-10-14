part of 'widgets.dart';

class DetailProductWidget extends StatelessWidget {
  final DetailProductModel detailProduct;

  const DetailProductWidget({super.key, required this.detailProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _displayProduct(context),
          const SizedBox(
            height: 10,
          ),
          _detailProduct(),
          _actionButton(),
          _addToCart(),
        ],
      ),
    );
  }

  Widget _displayProduct(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Hero(
              tag: detailProduct.id!,
              child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(detailProduct.image!))),
        ),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: warnaElite),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.star)),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _detailProduct() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: warnaBasic),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              detailProduct.title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: warnaElite),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('\$ ${detailProduct.price!}',
                style: const TextStyle(fontSize: 12, color: warnaMedium)),
            const SizedBox(
              height: 10,
            ),
            Text(detailProduct.description!,
                style: const TextStyle(color: warnaPremier)),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton() {
    return Container(
      color: warnaBasic,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: warnaTersier,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: warnaTersier),
                onPressed: () {},
                child: const Text(
                  "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addToCart() {
    return Container(
      color: warnaTersier,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: warnaSekunder),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: warnaElite)),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent),
              onPressed: () {},
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: warnaElite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
