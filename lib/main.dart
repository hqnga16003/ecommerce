import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.dart';

import 'package:firebase_core/firebase_core.dart';
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
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();



  //
  // Product p2 = Product(10, "Sitlly", 5, 22,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", 0, DateFormat.yMd().format(DateTime.now().time),categoryProduct: 'Sport Dress');
  // Product p3 = Product(4, "Dorothy Perkins", 2, 14,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", categoryProduct: 'Sport Dress');
  // Product p4 = Product(15, "Dorothy Perkins", 3, 15,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", categoryProduct: 'Sport Dress');
  // Product p5 = Product(10, "Sitlly", 5, 22,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", categoryProduct: 'Sport Dress');
  // Product p6 = Product(10, "Dorothy Perkins", 5, 14,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", categoryProduct: 'Sport Dress');
  // Product p7 = Product(10, "Dorothy Perkins", 5, 15,
  //     "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-3da7a.appspot.com/o/Products%2F3bcf169c1f1c4b22fc8fc4b86176e01a.png?alt=media&token=5e0c0c24-be3f-400d-8334-d3ef5b7a463b",
  //     "Sport Dress", categoryProduct: 'Sport Dress');

  @override
  Widget build(BuildContext context) {
    // Category category1 = Category("Evening Dress");
    // Category category2 = Category("T-Shirt");
    // Category category3 = Category("Shirt");
    // Category category4 = Category("Sport Dress");
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
     //firebaseFirestore.collection("Products").add(p2.toJson());
    // firebaseFirestore.collection("Products").add(p3.toJson());
    // firebaseFirestore.collection("Products").add(p4.toJson());
    // firebaseFirestore.collection("Products").add(p5.toJson());
    // firebaseFirestore.collection("Products").add(p6.toJson());
    // firebaseFirestore.collection("Products").add(p7.toJson());
    FrameSize.init(context: context);
    return MaterialApp.router(debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
