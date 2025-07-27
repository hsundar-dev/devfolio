import 'package:devfolio/screens/splash_screen.dart';
import 'package:devfolio/services/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'blocs/code_bloc/code_bloc.dart';


void main() async {
  Bloc.observer = AppBlocObserver();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CodeBloc())
          ],
          child: const Main()
      )
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              title: 'DevFolio',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen());
        }
    );
  }
}
