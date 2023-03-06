import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                    indicatorColor: kMainColor,
                    onTap: (value) {
                      setState(() {
                        _tabIndex = value;
                      });
                    },
                    tabs: [
                      Text('Jackets',
                          style: TextStyle(
                              fontWeight:
                                  _tabIndex == 0 ? FontWeight.bold : null,
                              fontSize: _tabIndex == 0 ? 16 : null,
                              color: _tabIndex == 0
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('Trousers',
                          style: TextStyle(
                              fontWeight:
                                  _tabIndex == 1 ? FontWeight.bold : null,
                              fontSize: _tabIndex == 1 ? 16 : null,
                              color: _tabIndex == 1
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('Shoes',
                          style: TextStyle(
                              fontWeight:
                                  _tabIndex == 2 ? FontWeight.bold : null,
                              fontSize: _tabIndex == 2 ? 16 : null,
                              color: _tabIndex == 2
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('T-shirts',
                          style: TextStyle(
                              fontWeight:
                                  _tabIndex == 3 ? FontWeight.bold : null,
                              fontSize: _tabIndex == 3 ? 16 : null,
                              color: _tabIndex == 3
                                  ? Colors.black
                                  : kUnActiveColor)),
                    ]),
              ),
              body: TabBarView(children: [
                jacketView('Jackets'),
                jacketView('Trousers'),
                jacketView('Shoes'),
                jacketView('Tshirts'),
              ]),
            )),
        Material(
          child: Container(
            height: MediaQuery.of(context).size.height * .15,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discover'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget jacketView(String prodCategory) {
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
}
