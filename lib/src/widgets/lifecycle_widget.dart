part of 'widgets.dart';

class LifecycleWidget extends StatefulWidget {
  final Widget child;

  const LifecycleWidget({super.key, required this.child});

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLiifecycleState: $state');
    if (state == AppLifecycleState.inactive) {
      print('APLIKASI INACTIVE');
    } else if (state == AppLifecycleState.detached) {
      print('SELAMAT TINGGAL');
    } else if (state == AppLifecycleState.paused) {
      print('APLIKASI BERJALAN DI LATAR BELAKANG');
    } else if (state == AppLifecycleState.resumed) {
      print('SELAMAT DATANG KEMBALII');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
