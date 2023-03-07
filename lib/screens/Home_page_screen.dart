import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/product_view.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  List _products = [];

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
                productView('Jackets'),
                productView('Trousers'),
                productView('Shoes'),
                productView('Tshirts'),
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

  
}
