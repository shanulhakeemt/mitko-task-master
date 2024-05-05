// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitco_task/core/common_bloc/order_model_bloc.dart';

import 'core/variables/mediaQuery.dart';
import 'features/auth/controller/Auth_controller.dart';
import 'features/auth/repository/Auth_repositorry.dart';
import 'features/auth/screen/bloc/auth_screen_bloc.dart';
import 'features/auth/screen/sign_in_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AuthScreenBloc(
              controller: AuthController(
                  repository: AuthRepository(
                      firebaseAuth: FirebaseAuth.instance,
                      firestore: FirebaseFirestore.instance)))),
      BlocProvider(
        create: (context) => OrderModelBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: SignInPage(),
    );
  }
}
