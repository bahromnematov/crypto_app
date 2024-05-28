import 'package:crypto_app/main/instagram_home_page.dart';
import 'package:crypto_app/auth/sign_in_page.dart';
import 'package:crypto_app/auth/splash_page.dart';
import 'package:crypto_app/main/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp()
  );
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyB40MS7yrYOgtA8oBPk4Ve41-l5rf7XU1Q',
    appId: '1:996828852573:android:99c9d3f715e6f1a3c338b4',
    messagingSenderId: 'sendid',
    projectId: 'emo1-f9951',
    storageBucket: 'demo1-f9951.appspot.com',
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        InstagramHomePage.id: (context) => InstagramHomePage(),
        UploadPage.id: (context) => UploadPage(),
      },
    );
  }
}
