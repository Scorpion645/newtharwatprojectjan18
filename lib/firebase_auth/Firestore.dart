import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class Store {
  final _fireStore = FirebaseFirestore.instance;

  addProduct(Product myProduct) {
    _fireStore.collection('Productss').add({
      'product name': myProduct.pName,
      'product category': myProduct.pCategory,
      'product description': myProduct.pDescription,
      'product price': myProduct.pPrice,
      'product image': myProduct.pImage
    });
  }
}
