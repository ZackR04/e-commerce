part of 'widgets.dart';

class GradientBackground extends StatelessWidget {
  final Scaffold child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.blue])),
      child: child,
    );
  }
}
