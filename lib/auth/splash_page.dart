import 'dart:async';

import 'package:crypto_app/auth/instagram_home_page.dart';
import 'package:crypto_app/auth/sign_in_page.dart';
import 'package:crypto_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      return _callNextPage();
    });
  }

  _callNextPage() {
    Navigator.pushReplacementNamed(context, SignInPage.id);

    if (AuthService.isLoggedIn()) {
      Navigator.pushReplacementNamed(context, InstagramHomePage.id);
    } else {
      Navigator.pushReplacementNamed(context, SignInPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontSize: 45, fontFamily: "Billabong"),
        ),
      ),
    );
  }
}
