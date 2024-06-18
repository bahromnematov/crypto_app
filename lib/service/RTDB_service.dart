import 'dart:convert';

import 'package:crypto_app/model/post_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RTDBService {
  static final _databse = FirebaseDatabase.instance.ref();

  //taomlar
  static Future<Stream<DatabaseEvent>> addTaomlar(Post post) async {
    _databse.child("post").push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getTaomlar() async {
    List<Post> items = [];

    Query _query = _databse.ref.child("post");
    DatabaseEvent event = await _query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
        name: map['name'],
        caption: map['caption'],
        img_url: map['img_url']
      );
      items.add(post);
    }
    return items;
  }


  //Salatlar
  static Future<Stream<DatabaseEvent>> addSalatlar(Post post) async {
    _databse.child("salatlar").push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getSalatlar() async {
    List<Post> items = [];

    Query _query = _databse.ref.child("salatlar");
    DatabaseEvent event = await _query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          name: map['name'],
          caption: map['caption'],
          img_url: map['img_url']
      );
      items.add(post);
    }
    return items;
  }



  //Ichimliklar

  static Future<Stream<DatabaseEvent>> addIchimliklar(Post post) async {
    _databse.child("ichimliklar").push().set(post.toJson());
    return _databse.onChildAdded;
  }

  static Future<List<Post>> getIchimliklar() async {
    List<Post> items = [];

    Query _query = _databse.ref.child("ichimliklar");
    DatabaseEvent event = await _query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          name: map['name'],
          caption: map['caption'],
          img_url: map['img_url']
      );
      items.add(post);
    }
    return items;
  }

}
