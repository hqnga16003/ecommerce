import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  var mess;
  Stream collectionStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    mess = chats
        .doc("oaJo6SfiQsG0zd2vMVGE")
        .collection('messages')
        .orderBy('createdOn', descending: true)
        .snapshots()
        .obs;
  }

}
