import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/auth.dart';
import 'features/auth/sign_in/sign_in.dart';

import 'core/utils/route_generator.dart';
import 'features/weather/views/views.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) =>
            AuthBloc()..add(const AuthEvent.listenFirebaseAuthStateChanges()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          onGenerateRoute: RouterGenerator.generateRoute,
          home: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  previous.isAuthenticated != current.isAuthenticated,
              builder: (context, state) {
                if (state.isAuthenticated) {
                  return const WeatherScreen();
                } else {
                  return const SignInScreen();
                }
              }),
        ),
      );
}
