import 'package:crypto_app/main/main/ichimliklar_page.dart';
import 'package:crypto_app/main/main/salatlar_page.dart';
import 'package:crypto_app/main/main/taomlar_page.dart';
import 'package:flutter/material.dart';


class InstagramHomePage extends StatefulWidget {
  static final String id = "instagram_page";

  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Milliy Taomlar"),
            bottom: TabBar(
              tabs: [
                Text("Taomlar"),
                Text("Salatlar"),
                Text("Ichimliklar"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TaomlarPage(),
              SalatlarPage(),
              IchimliklarPage()
            ],

          ),
        )

    );
  }
}
