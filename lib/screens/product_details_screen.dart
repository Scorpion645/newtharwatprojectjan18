import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/cart_products.dart';
import '../widgets/sizedbox.dart';

class ProductDetailsScreen extends StatefulWidget {
  static String id = 'product details screen';

  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                product['IMAGE'],
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 28,
                      )),
                  SizedBox(
                    width: 260,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_rounded)),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)),
                      color: Colors.black38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product['NAME'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          heightSizedbox(5),
                          Text(product['PRICE'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          heightSizedbox(5),
                          Text(product['DESCRIPTION'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          heightSizedbox(5),
                          Text('\$ ${product['PRICE']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: kMainColor,
                                  child: SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity--;
                                          });
                                        },
                                        icon: Icon(Icons.remove)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(_quantity.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.white)),
                              ),
                              ClipOval(
                                child: Material(
                                  color: kMainColor,
                                  child: SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 24,
                                          weight: 200,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(18)))),
                      backgroundColor: MaterialStatePropertyAll(kMainColor)),
                  onPressed: () {
                    // Provider.of<CartProducts>(context, listen: false)
                    //     .cartProducts[product] = _quantity as Map<int, dynamic>;
                    Provider.of<CartProducts>(context, listen: false)
                        .cartProducts
                        ..addEntries([MapEntry(product, _quantity)]);
                    print(Provider.of<CartProducts>(context, listen: false)
                        .cartProducts);
                    // print(Provider.of<CartProducts>(context, listen: false).cartProducts);
                  },
                  child: Text('Add to Cart'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black))))
        ],
      ),
    );
  }
}
