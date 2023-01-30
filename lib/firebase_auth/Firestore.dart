import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class Store {
  final _fireStore = FirebaseFirestore.instance;
  // List<Product> products = [];
  addProduct(Product myProduct) {
    _fireStore.collection('Productss').add({
      'product name': myProduct.pName,
      'product category': myProduct.pCategory,
      'product description': myProduct.pDescription,
      'product price': myProduct.pPrice,
      'product image': myProduct.pImage
    });
  }

  // Stream<QuerySnapshot> loadProducts()  {
  //   return _fireStore.collection('Hello').snapshots();
  // }

  // Future<List<Product>> loadProducts() async {
  //   var snapshot = await _fireStore.collection('productss').get();
  //   List<Product> products = [];
  //   for (var doc in snapshot.docs) {
  //     products.add(Product(pCategory: doc.data[], pDescription: pDescription, pImage: pImage, pName: pName, pPrice: pPrice))
  //   }
  // }
}
