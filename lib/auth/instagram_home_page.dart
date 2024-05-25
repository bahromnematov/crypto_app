import 'package:crypto_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class InstagramHomePage extends StatefulWidget {
  static final String id="instagram_page";
  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            AuthService.signOutUser(context);
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
