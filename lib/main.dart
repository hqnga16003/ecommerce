import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app/FrameSize.dart';
import 'app/locator/locator.dart';
import 'app/theme/theme.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  configureDependencies();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return MaterialApp.router(debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
class Test extends StatelessWidget {
  Test({super.key});

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print("Title: ${message.notification?.title}");
  print("body: ${message.notification?.body}");
  print("payload: ${message.data}");

}
class FirebaseApi{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

