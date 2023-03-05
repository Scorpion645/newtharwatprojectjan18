// ignore_for_file: prefer_const_constructors

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtharwatprojectjan18/constants/constants.dart';

class HomePage extends StatefulWidget {
  static String id = 'home page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = Auth();

  // FirebaseUser _loggedUser;

  int _tabBarIndex = 0;
  int _bottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                // ignore: prefer_const_literals_to_create_immutables
                bottom: TabBar(
                    indicatorColor: kMainColor,
                    onTap: (value) {
                      setState(() {
                        _tabBarIndex = value;
                      });
                    },
                    tabs: [
                      Text('Jackets',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _tabBarIndex == 0 ? 16 : null,
                              color: _tabBarIndex == 0
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('Trousers',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _tabBarIndex == 1 ? 16 : null,
                              color: _tabBarIndex == 1
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('T-shirts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _tabBarIndex == 2 ? 16 : null,
                              color: _tabBarIndex == 2
                                  ? Colors.black
                                  : kUnActiveColor)),
                      Text('Shoes',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _tabBarIndex == 3 ? 16 : null,
                              color: _tabBarIndex == 3
                                  ? Colors.black
                                  : kUnActiveColor)),
                    ]),
              ),
              body: TabBarView(children: [
                jacketView(),
                Text('Test'),
                Text('Test'),
                Text('Test'),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  fixedColor: kMainColor,
                  currentIndex: _bottomNavBar,
                  onTap: ((value) {
                    setState(() {
                      _bottomNavBar = value;
                    });
                  }),
                  items: [
                    BottomNavigationBarItem(
                        label: 'Person', icon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        label: 'Person', icon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        label: 'Person', icon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        label: 'Person', icon: Icon(Icons.person)),
                  ]),
            )),
        Material(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discover'.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget jacketView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Hello').snapshots(),
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
                  print(products[index]);
                  return GestureDetector(
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
