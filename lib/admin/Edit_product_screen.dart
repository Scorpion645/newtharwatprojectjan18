import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product screen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Hello').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List products = [];
            if (snapshot.hasData) {
              for (var doc in snapshot.data.docs) {
                products.add(doc.data());
              }
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  print(products[index]);
                  return Center(child: Text(products[index]['NAME'].toString()));
                },
              );
            } else {
              return Center(child: Text('Loading...'));
            }
          }),
    );
  }
}
