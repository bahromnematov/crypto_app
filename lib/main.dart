import 'package:crypto_app/main/instagram_home_page.dart';
import 'package:crypto_app/auth/sign_in_page.dart';
import 'package:crypto_app/auth/splash_page.dart';
import 'package:crypto_app/main/upload/upload_page.dart';
import 'package:crypto_app/pdf/home_page2.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBpoo6ExVkWJKytULqYVtX3-IH0maR6SVo",
            authDomain: "demo1-f9951.firebaseapp.com",
            databaseURL: "https://demo1-f9951-default-rtdb.firebaseio.com",
            projectId: "demo1-f9951",
            storageBucket: "demo1-f9951.appspot.com",
            messagingSenderId: "996828852573",
            appId: "1:996828852573:web:677117258c799c3bc338b4",
            measurementId: "G-5E5T7G9575"));
  } else {
    await Firebase.initializeApp(
          options: FirebaseOptions(
        apiKey: 'AIzaSyB40MS7yrYOgtA8oBPk4Ve41-l5rf7XU1Q',
        appId: '1:996828852573:android:99c9d3f715e6f1a3c338b4',
        messagingSenderId: 'sendid',
        projectId: 'demo1-f9951',
        storageBucket: 'demo1-f9951.appspot.com',
        )
        );
  }

  runApp(const MyApp()
  );
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
