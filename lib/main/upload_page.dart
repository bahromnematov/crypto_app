import 'package:crypto_app/service/RTDB_service.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class UploadPage extends StatefulWidget {
  static final String id = "upload_page";

  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  var isLoading = false;
  final nameController = TextEditingController();
  final captionController = TextEditingController();

  _createPost() {
    String name = nameController.text.toString().trim();
    String caption = captionController.text.toString().trim();

    if (name.isEmpty || caption.isEmpty) return;

    _apiCretePost(name, caption);
  }

  _apiCretePost(String firstName, String content) {
    setState(() {
      isLoading = true;
    });
    var post = Post(name: firstName, caption: content);
    RTDBService.addPost(post).then((value) => {
      _resAddPost(),
    });
  }

  _resAddPost() {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({'data': 'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Upload Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: captionController,
                  decoration: InputDecoration(hintText: "Caption"),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _createPost();
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
