
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

Widget productView(String productCategory) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('New Collection').snapshots(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      List products = [];
      if (snapshot.hasData) {
        for (var doc in snapshot.data.docs) {
          if (doc['CATEGORY'] == productCategory) {
            products.add(doc);
          }
        }
      }
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailsScreen.id, arguments: products[index]);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          products[index]['IMAGE'],
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(14)),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(products[index]['NAME'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white)),
                            Text('\$ ${products[index]['PRICE']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
