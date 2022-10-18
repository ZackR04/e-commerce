part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  NotificationService notifService = NotificationService();

  Future<dynamic> onReceiveNotif(int id, String? title, String? body) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kamu Mendapatkan $body')));
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void showNotif() {
    notifService.showNotifBirthday(
        "Selamat Ulang Tahun",
        "Untuk kamu yang berulang tahun, kami beri promo diskon 50% untuk produk ini yaa",
        "4");
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Notif akan muncul setelah 5 detik")));
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: ((context) => DetailProductScreen(
                productId: int.parse(payload!),
              )),
        ));
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
    notifService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3),
        onDidReceiveNotificationResponse);
    super.initState();
  }

  int bottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: warnaSekunder,
          title: const Text(
            'Fashion & Lifestyle',
            style: TextStyle(fontSize: 15, color: warnaElite),
          ),
          actions: [
            IconButton(onPressed: showNotif, icon: const Icon(Icons.person)),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: warnaElite,
            ),
          ),
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
        body: (bottomNavBar == 0)
            ? Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: warnaBasic,
                child: const GridProduct())
            : const ListProduct(),
      ),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
      if (state is ProductIsFailed) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, builder: (context, state) {
      if (state is ProductIsLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductIsSuccess) {
        return ListView.builder(
          itemCount: state.data.length,
          itemBuilder: (context, index) {
            return ProductWidget(product: state.data[index]);
          },
        );
      }
      return Container();
    });
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductIsFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ProductIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ProductIsSuccess) {
          return GridView.count(
            padding: const EdgeInsets.symmetric(vertical: 20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: state.data.map((e) => ProductWidget(product: e)).toList(),
          );
        }
        return Container();
      },
    );
  }
}
