
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget productView(String prodCategory) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Hello').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List products = [];
        if (snapshot.hasData) {
          for (var doc in snapshot.data.docs) {
            if (doc['CATEGORY'] == prodCategory) {
              products.add(doc);
            }
            
          }
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                
              },
              child: Stack(
                children: [
                  Center(
                      child: Image.asset(
                    products[index]['IMAGE'],
                    fit: BoxFit.fill,
                  )),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index]['NAME'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
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
