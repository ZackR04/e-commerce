part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int bottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(162, 255, 115, 0),
        title: const Text('Fashion & Lifestyle'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavBar,
          onTap: (value) {
            setState(() {
              bottomNavBar = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3), label: 'GridView'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView')
          ]),
      body: (bottomNavBar == 0) ? const GridProduct() : const ListProduct(),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: http.get(Uri.parse("https://fakestoreapi.com/products")),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final products = productModelFromJson(snapshot.data.body);
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductWidget(product: products[index]);
                });
          }
          return Container();
        });
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: http.get(Uri.parse("https://fakestoreapi.com/products")),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final products = productModelFromJson(snapshot.data.body);
            return GridView.count(
              crossAxisCount: 2,
              children: products.map((e) => ProductWidget(product: e)).toList(),
            );
          }
          return Container();
        });
  }
}
