import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/product_view.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home screen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabBarIndex = 0;
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              bottom: TabBar(
                  indicatorColor: kMainColor,
                  onTap: (value) {
                    setState(() {
                      _tabBarIndex = value;
                    });
                  },
                  tabs: [
                    Text(
                      'Jackets',
                      style: TextStyle(
                        color:
                            _tabBarIndex == 0 ? Colors.black : kUnActiveColor,
                        fontSize: _tabBarIndex == 0 ? 16 : null,
                      ),
                    ),
                    Text(
                      'Trousers',
                      style: TextStyle(
                        color:
                            _tabBarIndex == 1 ? Colors.black : kUnActiveColor,
                        fontSize: _tabBarIndex == 1 ? 16 : null,
                      ),
                    ),
                    Text(
                      'T-shirts',
                      style: TextStyle(
                        color:
                            _tabBarIndex == 2 ? Colors.black : kUnActiveColor,
                        fontSize: _tabBarIndex == 2 ? 16 : null,
                      ),
                    ),
                    Text(
                      'Shoes',
                      style: TextStyle(
                        color:
                            _tabBarIndex == 3 ? Colors.black : kUnActiveColor,
                        fontSize: _tabBarIndex == 3 ? 16 : null,
                      ),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              productView('jackets'),
              productView('trousers'),
              productView('t-shirts'),
              productView('shoes'),
            ]),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _bottomBarIndex,
                selectedItemColor: kMainColor,
                unselectedItemColor: kUnActiveColor,
                onTap: (value) {
                  setState(() {
                    _bottomBarIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Test'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Test'),
                      BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Test'),
                      BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Test'),
                ]),
          ),
        ),
        Material(
          child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('DISCOVER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Icon(
                      Icons.shopping_cart,
                      size: 26,
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
