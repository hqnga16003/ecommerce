import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/model/list_order.dart';
import 'package:ecommerce_app/model/product_cart.dart';
import 'package:ecommerce_app/model/review_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../model/category.dart';
import '../model/product.dart';

@singleton
class FirebaseFireStoreRepository {
  final _collectionProducts = 'Products';
  final _collectionBrand = "Brand";
  final _collectionCategories = 'Categories';
  final _collectionCart = 'Cart';
  final _collectionReviewProduct = 'ReviewProduct';
  final _collectionFavorites = 'Favorites';
  final _collectionAddress = 'Addresses';
  final _collectionOrder = 'Orders';

  final FirebaseFirestore firebaseFireStore;

  FirebaseFireStoreRepository(this.firebaseFireStore);

  Future<void> submitOrder(
      List<ProductCart> cart, totalPrice, AddressUser addressUser) async {
    ListOrders listOrders = ListOrders(DateTime.now(), cart, totalPrice,
        FirebaseAuth.instance.currentUser!.uid, addressUser);
    firebaseFireStore.collection(_collectionOrder).add(listOrders.toJson());
  }

  Future<void> clearCart() async {
    firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<List<AddressUser>> getAddressesUser() async {
    List<AddressUser> list = [];
    await firebaseFireStore
        .collection(_collectionAddress)
        .where("idUser", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          list.add(AddressUser.fromJson(docSnapshot.data()));
        }
      },
    );
    return list;
  }

  Future<void> changeAddressDefault(String id) async {
    firebaseFireStore
        .collection(_collectionAddress)
        .doc(id)
        .update({"isChoose": false});
  }

  Future<void> addAddressUser(AddressUser addressUser) async {
    firebaseFireStore
        .collection(_collectionAddress)
        .add(addressUser.toJson())
        .then((value) => value.update({"idAddress": value.id}));
  }

  Future<void> addFavorite(Product product, String size, String color) async {
    final data = {
      "idProduct": product.idProduct,
      "color": color,
      "size": size,
      "idUser": FirebaseAuth.instance.currentUser?.uid
    };

    firebaseFireStore
        .collection(_collectionFavorites)
        .where("idProduct", isEqualTo: product.idProduct)
        .where("idUser", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where("color", isEqualTo: color)
        .where("size", isEqualTo: size)
        .limit(1)
        .get()
        .then(
      (QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isEmpty) {
          firebaseFireStore.collection(_collectionFavorites).add(data);
        }
      },
    );
  }

  Future<List<Product>> getAllProductsNew() async {
    List<Product> list = [];
    try {
      await firebaseFireStore
          .collection(_collectionProducts)
          .orderBy("createAt", descending: true)
          .limit(5)
          .get()
          .then(
        (querySnapshot) async {
          for (var docSnapshot in querySnapshot.docs) {
            list.add(Product.fromJson(docSnapshot.data()));
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
          .limit(5)
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

  Future<List<String>> getAllBrands() async {
    List<String> brands = [];
    try {
      await firebaseFireStore.collection(_collectionBrand).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            brands.add(docSnapshot.get("name"));
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    } on FirebaseException catch (e) {
      print("getAllBrands " + e.toString());
    } catch (e) {
      print("getAllBrands " + e.toString());
      throw Exception(e);
    }
    return brands;
  }

  Future<void> addToCart(Product product, String size, String color) async {
    firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("idProduct", isEqualTo: product.idProduct)
        .where("color", isEqualTo: color)
        .where("size", isEqualTo: size)
        .get()
        .then(
      (querySnapshot) {
        if (querySnapshot.size != 1) {
          ProductCart productCart = ProductCart(
              product, size, 1, FirebaseAuth.instance.currentUser!.uid, color);

          final data = {
            "color": color,
            "idCustomer": FirebaseAuth.instance.currentUser!.uid,
            "idProduct": product.idProduct,
            "quantity": 1,
            "size": size
          };

          firebaseFireStore.collection(_collectionCart).add(data);
        } else {
          for (var docSnapshot in querySnapshot.docs) {
            var productCurrent = firebaseFireStore
                .collection(_collectionCart)
                .doc(docSnapshot.id);
            productCurrent.update({"quantity": FieldValue.increment(1)});
          }
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Future<List<ProductCart>> getProductsCart() async {
    List<ProductCart> list = [];
    await firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          await firebaseFireStore
              .collection(_collectionProducts)
              .doc(docSnapshot.get("idProduct"))
              .get()
              .then(
            (DocumentSnapshot doc) {
              Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
              Product product = Product.fromJson(map);

              ProductCart productCart = ProductCart(
                  product,
                  docSnapshot.get("size"),
                  docSnapshot.get("quantity"),
                  docSnapshot.get("idCustomer"),
                  docSnapshot.get("color"));
              list.add(productCart);
            },
            onError: (e) => print("Error getting document: $e"),
          );
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return list;
  }

  Future<List<ReviewProduct>> getReviewProductById(String idProduct) async {
    List<ReviewProduct> list = [];

    await firebaseFireStore
        .collection(_collectionReviewProduct)
        .where("idProduct", isEqualTo: idProduct)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          list.add(ReviewProduct.fromJson(docSnapshot.data()));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    list.sort((a, b) => b.createAt.compareTo(a.createAt));
    return list;
  }

  Future<void> addReviewProduct(ReviewProduct reviewProduct) async {
    firebaseFireStore
        .collection(_collectionReviewProduct)
        .add(reviewProduct.toJson());

    firebaseFireStore
        .collection(_collectionProducts)
        .doc(reviewProduct.idProduct)
        .update({"numberReviews": FieldValue.increment(1)});
  }

  Future<void> updateNumberRatingProduct(String idProduct, int rating) async {
    firebaseFireStore
        .collection(_collectionProducts)
        .doc(idProduct)
        .update({"numberRating": rating});
  }

  Future<void> incrementProductCart(ProductCart productCart) async {
    firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("idProduct", isEqualTo: productCart.product.idProduct)
        .where("color", isEqualTo: productCart.color)
        .where("size", isEqualTo: productCart.size)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          var productCurrent =
              firebaseFireStore.collection(_collectionCart).doc(docSnapshot.id);
          productCurrent.update({"quantity": FieldValue.increment(1)});
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Future<void> decrementProductCart(ProductCart productCart) async {
    firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("idProduct", isEqualTo: productCart.product.idProduct)
        .where("color", isEqualTo: productCart.color)
        .where("size", isEqualTo: productCart.size)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          var productCurrent =
              firebaseFireStore.collection(_collectionCart).doc(docSnapshot.id);
          productCurrent.update({"quantity": FieldValue.increment(-1)});
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Future<void> removeProductCart(ProductCart productCart) async {
    firebaseFireStore
        .collection(_collectionCart)
        .where("idCustomer", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("idProduct", isEqualTo: productCart.product.idProduct)
        .where("color", isEqualTo: productCart.color)
        .where("size", isEqualTo: productCart.size)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          var productCurrent =
              firebaseFireStore.collection(_collectionCart).doc(docSnapshot.id);
          productCurrent.delete();
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
