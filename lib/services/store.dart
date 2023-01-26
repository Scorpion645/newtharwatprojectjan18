import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/constants.dart';
import '../models/product.dart';

class Store {
  final _fireStore = FirebaseFirestore.instance;

  AddProduct(Product myProduct) {
    _fireStore.collection(kProductsCollection).add({
kProductName : myProduct.pName,
kProductPrice : myProduct.pPrice,
kProductCategory : myProduct.pCategory,
kProductDescription : myProduct.pDescription,
kProductLocation : myProduct.pLocation,
    });
  }
}
