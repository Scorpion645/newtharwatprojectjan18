import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../firebase_auth/Firestore.dart';
import '../../models/Product.dart';

class EditProduct extends StatefulWidget {
  static String id = 'edit product';
  EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    print('products length');
    // print(_store.products.length);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:  FirebaseFirestore.instance.collection('Hello').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Product> products = [];
          if (snapshot.hasData) {
            

            for (var doc in snapshot.data.docs) {
              var data = doc.data();
              products.add(Product(
                  pCategory: data['CATEGORY'],
                  pDescription: data['DESCRIPTION'],
                  pImage: data['IMAGE'],
                  pName: data['NAME'],
                  pPrice: data['PRICE']));
              print(products.length);
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text(products[index].pName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black)),
                );
              },
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
