import 'package:bringin/view/login_select_screen.dart';
import 'package:bringin/view/otp_screen.dart';
import 'package:bringin/view/scplash_screen.dart';
import 'package:bringin/view/signinandup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "roboto",
      ),
      initialRoute: OTPScreen.id,
      routes: {
        SplashScreen.id: ((context) => const SplashScreen()),
        LoginSelectScreeen.id: (context) => const LoginSelectScreeen(),
        AuthenticationScreen.id: (context) => const AuthenticationScreen(),
        OTPScreen.id:(context) => const OTPScreen(),
      },
    );
  }
}

