import 'package:ecommerce/src/blocs/blocs.dart';
import 'package:ecommerce/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'e-Commerce',
        home: SplashScreen(),
      ),
    );
  }
}
