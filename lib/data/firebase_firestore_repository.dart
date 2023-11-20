import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../model/category.dart';
import '../model/product.dart';
import '../model/product_discount.dart';

@singleton
class FirebaseFireStoreRepository {
  final _collectionProducts = 'Products';
  final _collectionProductsNew = 'ProductsNew';
  final _collectionProductsSale = 'ProductsSale';
  final _collectionCategories = 'Categories';

  final FirebaseFirestore firebaseFireStore;

  FirebaseFireStoreRepository(this.firebaseFireStore);

  Future<List<Product>> getAllProductsNew() async {
    List<Product> list = [];
    try {
      await firebaseFireStore.collection(_collectionProductsNew).get().then(
        (querySnapshot) async {
          for (var docSnapshot in querySnapshot.docs) {
            await firebaseFireStore
                .collection(_collectionProducts)
                .doc(docSnapshot.get("idProduct"))
                .get()
                .then(
              (DocumentSnapshot doc) {
                list.add(Product.fromJson(doc.data() as Map<String, dynamic>));
              },
              onError: (e) => print("Error getting document: $e"),
            );
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    } on FirebaseException catch (e) {
      print("getAllProductsNew " + e.toString());
    } catch (e) {
      print("getAllProductsNew " + e.toString());
      throw Exception(e);
    }
    return list;
  }

  Future<List<Product>> getAllProductsSale() async {
    List<Product> list = [];
    try {
      await firebaseFireStore
          .collection(_collectionProducts)
          .where("discount", isNotEqualTo: 0)
          .get()
          .then(
            (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            list.add(Product.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    } on FirebaseException catch (e) {
      print("getAllProductsSale " + e.toString());
    } catch (e) {
      print("getAllProductsSale " + e.toString());
      throw Exception(e);
    }
    print(list.length);
    return list;
  }

  Future<List<Category>> getAllCategories() async {
    List<Category> list = [];
    try {
      await firebaseFireStore.collection(_collectionCategories).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            list.add(Category.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    } on FirebaseException catch (e) {
      print("getAllCategories1 " + e.toString());
    } catch (e) {
      print("getAllCategories " + e.toString());
      throw Exception(e);
    }
    return list;
  }

  Future<List<Product>> getProductsByCategory(String nameCategory) async {
    List<Product> list = [];
    try {
      await firebaseFireStore
          .collection(_collectionProducts)
          .where("categoryProduct", isEqualTo: nameCategory)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            list.add(Product.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    } on FirebaseException catch (e) {
      print("getAllCategories1 " + e.toString());
    } catch (e) {
      print("getAllCategories " + e.toString());
      throw Exception(e);
    }
    return list;
  }
}
