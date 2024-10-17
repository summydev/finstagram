import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:path/path.dart' as p;

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  String USER_COLLECTION = 'users';
  String POST_COLLECTION = 'posts';
  Map? currentUser;
  FirebaseService();
  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = _userCredential.user!.uid;
      String _fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      UploadTask _task =
          _storage.ref('images/$userId/$_fileName').putFile(image);
      return _task.then((_snapshot) async {
        String _downloadUrl = await _snapshot.ref.getDownloadURL();
        await _db
            .collection(USER_COLLECTION)
            .doc(userId)
            .set({"name": name, "email": email, "image": _downloadUrl});
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        currentUser = await getUserData(uId: userCredential.user!.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map> getUserData({required String uId}) async {
    DocumentSnapshot _doc =
        await _db.collection(USER_COLLECTION).doc(uId).get();
    return _doc.data() as Map;
  }

  Future<bool> postImage(File _image) async {
    try {
      String userID = _auth.currentUser!.uid;
      String filename = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(_image.path);
      UploadTask _task =
          _storage.ref('images/$userID/$filename').putFile(_image);
      return await _task.then(
        (_snapshot) async {
          String _downloadUrl = await _snapshot.ref.getDownloadURL();
          await _db.collection(POST_COLLECTION).add({
            "userId": userID,
            "image": _downloadUrl,
            "timestamp": Timestamp.now()
          });
          return true;
        },
      );
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<QuerySnapshot> getLatestPosts() {
    return _db
        .collection(POST_COLLECTION)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getPostForUser() {
    String userId = _auth.currentUser!.uid;
    return _db
        .collection(POST_COLLECTION)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
  Future<void> logout()async{
   await _auth.signOut();
  }
}
