import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/product_view.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(indicatorColor: kMainColor, tabs: [
                Text('Jackets',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                Text('Trousers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                Text('T-shirts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                Text('Shoes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
              ]),
            ),
            body: TabBarView(children: [
              productView('Jackets'),
              productView('Trousers'),
              productView('Tshirts'),
              productView('Shoes'),
            ])),
      ),
      Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DISCOVER',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                IconButton(onPressed: () {
                  Navigator.pushNamed(context, CartScreen.id);
                }, icon: Icon(Icons.shopping_cart)),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
