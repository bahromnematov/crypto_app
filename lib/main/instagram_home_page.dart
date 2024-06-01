import 'package:crypto_app/main/upload_page.dart';
import 'package:crypto_app/service/RTDB_service.dart';
import 'package:crypto_app/service/auth_service.dart';
import 'package:crypto_app/service/url_service.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class InstagramHomePage extends StatefulWidget {
  static final String id = "instagram_page";

  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  List<Post> items = [];

  Future _callUploadPage() async {
    Map result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return UploadPage();
    }));
    if (result != null && result.containsKey("data")) ;
    print(result['data']);

    _apiPostList();
  }

  _apiPostList() async {
    var list = await RTDBService.getPosts();
    items.clear();
    setState(() {
      items = list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                AuthService.signOutUser(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                UrlService.launchInBrauther(
                    Uri.parse("https://pub.dev/packages/url_launcher/install"));
              },
              icon: Icon(Icons.location_pin))
        ],
        title: Text(
          "Firebase",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 120,
                    child: items[index].img_url != null
                        ? Image.network(
                            items[index].img_url!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/icon/upload.jpg")),
                Text(
                  items[index].name!,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(items[index].caption!),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _callUploadPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
