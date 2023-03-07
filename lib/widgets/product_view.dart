import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget productView(String prodCategory) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Jackets').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List products = [];
          if (snapshot.hasData) {
            for (var doc in snapshot.data.docs) {
              // var data = doc.data;
              if (doc['CATEGORY'] == prodCategory) {
                products.add(doc.data());
              }
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                // print('the product is'+ '${products[index]}');
                return GestureDetector(
                  onTapUp: (details) {},
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(children: [
                      Positioned.fill(
                          child: Image.asset(
                        '${products[index]['IMAGE']}',
                        fit: BoxFit.cover,
                      )),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index]['NAME'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text('\$ ${products[index]['PRICE']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        }),
  );
}
