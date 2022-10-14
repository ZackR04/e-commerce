part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const LifecycleWidget(child: ListScreen())));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Lottie.asset("assets/animations/splash_screen.json",
                  repeat: false),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("e-Commerce",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
          ],
        ),
      ),
    );
  }
}
