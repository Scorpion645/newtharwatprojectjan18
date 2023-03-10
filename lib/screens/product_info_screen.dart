import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProductInfoScreen extends StatefulWidget {
  static String id = 'Product information';

  ProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
                fit: BoxFit.contain, image: AssetImage(product['IMAGE']))),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 26,
              ),
              Icon(
                Icons.shopping_cart,
                size: 26,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['NAME'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(product['DESCRIPTION'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('\$ ${product['PRICE']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Material(
                                color: kMainColor,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 28,
                                    width: 28,
                                    child: Icon(Icons.add),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(_quantity.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                          ),
                          ClipOval(
                            child: Material(
                                color: kMainColor,
                                child: GestureDetector(
                                  onTap: () {
                                    if (_quantity > 0) {
                                      setState(() {
                                        _quantity--;
                                      });
                                    }
                                  },
                                  child: SizedBox(
                                    height: 28,
                                    width: 28,
                                    child: Icon(Icons.remove),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width, 60)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {},
                  child: Text('Add to cart'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black))),
            ],
          ),
        )
      ],
    ));
  }
}
