import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Edit_product_screen.dart';

class ManageProductScreen extends StatelessWidget {
  static String id = 'Manage product screen';
  // late DocumentReference _documentReference;
  ManageProductScreen({Key? key}) : super(key: key) {
    //   _documentReference = FirebaseFirestore.instance.collection('Hello').doc(id);
    //   _documentReference = _documentReference.get() as DocumentReference<Object?>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Jackets').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List products = [];
            if (snapshot.hasData) {
              for (var doc in snapshot.data.docs) {
                products.add(doc.data());
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
                    onTapUp: (details) {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.width - dx;
                      double dy2 = MediaQuery.of(context).size.height - dy;
                      showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            PopupMenuItem(
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, EditProductScreen.id,
                                          arguments: snapshot.data.docs[index]);
                                    },
                                    child: Text('Edit'))),
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('Jackets')
                                      .doc(snapshot.data.docs[index].id)
                                      .delete();
                                  Navigator.pop(context);
                                },
                                child: Text('Delete'),
                              ),
                            )
                          ]);
                    },
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
}
