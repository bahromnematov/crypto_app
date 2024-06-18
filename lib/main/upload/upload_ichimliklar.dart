import 'dart:io';

import 'package:crypto_app/service/RTDB_service.dart';
import 'package:crypto_app/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/post_model.dart';

class UploadIchimliklar extends StatefulWidget {
  static final String id = "upload_page";

  const UploadIchimliklar({super.key});

  @override
  State<UploadIchimliklar> createState() => _UploadIchimliklarState();
}

class _UploadIchimliklarState extends State<UploadIchimliklar> {
  var isLoading = false;
  final nameController = TextEditingController();
  final captionController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image");
      }
    });
  }

  _createPost() {
    String name = nameController.text.toString().trim();
    String caption = captionController.text.toString().trim();

    if (name.isEmpty || caption.isEmpty) return;

    _apiUploadImage(name, caption);
  }

  _apiUploadImage(String name, String content) {
    setState(() {
      isLoading = true;
    });
    StorageService.uploadImage(_image!).then((img_url) => {
          _apiCreateIchimliklar(name, content, img_url),
        });
  }

  _apiCreateIchimliklar(String name, String content, String img_url) {
    var post = Post(name: name, caption: content, img_url: img_url);
    RTDBService.addIchimliklar(post).then((value) => {
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
              children: [
                InkWell(
                  onTap: () {
                    _getImage();
                  },
                  child: Container(
                      height: 100,
                      width: 100,
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset("assets/icon/upload.jpg")),
                ),
                SizedBox(
                  height: 20,
                ),
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
