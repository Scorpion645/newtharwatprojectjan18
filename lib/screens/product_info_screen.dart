import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/cart_item.dart';
import 'cart_screen.dart';

class ProductInfoScreen extends StatefulWidget {
  static String id = 'Product information';

  ProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  int _quantity = 1;

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
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(
                Icons.arrow_back_ios,
                size: 26,
              ),),
              
              IconButton(onPressed: (){
                Navigator.pushNamed(context, CartScreen.id);
              }, icon: Icon(
                  Icons.shopping_cart,
                  size: 26,
                ),
              )
              
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
                                    if (_quantity > 1) {
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(_quantity.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                          ),
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
                  onPressed: () {
                    Provider.of<CartItem>(context, listen: false)
                        .addProduct(product);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                   content: Text(
                   'Product added successfully!!',
                   style:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                   textAlign: TextAlign.center,
                   )));
                  },
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
