import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class Store {
  final _firestore = FirebaseFirestore.instance;

  addProduct(Product newProduct) {
    _firestore.collection('Products').add({
      'product name': newProduct.Pname,
      'product price': newProduct.Pprice,
      'product category': newProduct.Pcategory,
      'product description': newProduct.Pdescription,
      'product image': newProduct.Pimage,
    });
  }
}
