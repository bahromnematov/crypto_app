import 'package:crypto_app/main/upload/upload_ichimliklar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/post_model.dart';
import '../../service/RTDB_service.dart';
import '../upload/upload_page.dart';

class IchimliklarPage extends StatefulWidget {
  const IchimliklarPage({super.key});

  @override
  State<IchimliklarPage> createState() => _IchimliklarPageState();
}

class _IchimliklarPageState extends State<IchimliklarPage> {


  List<Post> items = [];

  Future _callUploadPage() async {
    Map result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return UploadIchimliklar();
    }));
    if (result != null && result.containsKey("data")) ;
    print(result['data']);

    _apiPostList();
  }

  _apiPostList() async {
    var list = await RTDBService.getIchimliklar();
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
      floatingActionButton: kIsWeb
          ? null
          : FloatingActionButton(
        onPressed: () {
          _callUploadPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
