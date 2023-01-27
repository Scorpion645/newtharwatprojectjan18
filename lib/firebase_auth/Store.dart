

import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/constants.dart';
import '../models/product.dart';

class Store {
 final _fireStore = FirebaseFirestore.instance;

  addProduct (Product newProduct){
_fireStore.collection(kProductsCollection).add({
  'productName': newProduct.name,
  'productCategory': newProduct.category,
  'productDescription': newProduct.description,
  'productImage': newProduct.image,
  'productPrice': newProduct.price,
});
  }
}