import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/cart_item.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart screen';
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int price = 0;
  int count = 0;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    Map products = Provider.of<CartItem>(context).products;
    final CartItemProvider = Provider.of<CartItem>(context, listen: false);
    dynamic totalPrice = ModalRoute.of(context)?.settings.arguments;
    int totalCost = CartItemProvider.totalCoast;
    int totalItemCost = 0;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (products.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: ((context, index) {
                        int prodCount = products.values.elementAt(index);
                        int prodPrice =
                            int.parse(products.keys.elementAt(index)['PRICE']);
                        int totItemPrice = prodCount * prodPrice;

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    products.keys.elementAt(index)['IMAGE'])),
                            title: Text(products.keys.elementAt(index)['NAME'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text(
                                '\$ ${products.keys.elementAt(index)['PRICE']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Total: '),
                                Text('\$ ${totItemPrice}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: Material(
                                            color: kMainColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                if (products.values
                                                        .elementAt(index) >
                                                    1) {
                                                  setState(() {
                                                    prodCount--;
                                                    Provider.of<CartItem>(
                                                            context,
                                                            listen: false)
                                                        .addProduct(
                                                            products.keys
                                                                .elementAt(
                                                                    index),
                                                            prodCount);
                                                            Provider.of<CartItem>(
                                                            context,
                                                            listen: false)
                                                        .totalCoast = 0;

                                                    for (var entry in Provider
                                                            .of<CartItem>(
                                                                context,
                                                                listen: false)
                                                        .products
                                                        .entries) {
                                                      Provider.of<CartItem>(
                                                              context,
                                                              listen: false)
                                                          .totalCoast += (entry
                                                              .value) *
                                                          (int.parse(entry
                                                              .key['PRICE']
                                                              .toString()));
                                                      Provider.of<CartItem>(
                                                                  context,
                                                                  listen: false)
                                                              .totalCoast +=
                                                          totalItemCost;
                                                    }
                                                  });
                                                }
                                              },
                                              child: SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Icon(Icons.remove,
                                                    size: 18),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                            products.values
                                                .elementAt(index)
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ),
                                      ClipOval(
                                        child: Material(
                                            color: kMainColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  prodCount++;
                                                  products[products.keys
                                                          .elementAt(index)] =
                                                      prodCount;
                                                  Provider.of<CartItem>(context,
                                                          listen: false)
                                                      .totalCoast = 0;

                                                  for (var entry
                                                      in Provider.of<CartItem>(
                                                              context,
                                                              listen: false)
                                                          .products
                                                          .entries) {
                                                    Provider.of<CartItem>(
                                                                context,
                                                                listen: false)
                                                            .totalCoast +=
                                                        (entry.value) *
                                                            (int.parse(entry
                                                                .key['PRICE']
                                                                .toString()));
                                                    Provider.of<CartItem>(
                                                                context,
                                                                listen: false)
                                                            .totalCoast +=
                                                        totalItemCost;
                                                  }
                                                });
                                              },
                                              child: SizedBox(
                                                height: 24,
                                                width: 24,
                                                child:
                                                    Icon(Icons.add, size: 18),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<CartItem>(context,
                                                listen: false)
                                            .removeProduct(
                                                products.keys.elementAt(index),
                                                prodCount);
                                                Provider.of<CartItem>(context,
                                                listen: false)
                                            .totalCoast = 0;

                                        for (var entry in Provider.of<CartItem>(
                                                context,
                                                listen: false)
                                            .products
                                            .entries) {
                                          Provider.of<CartItem>(context,
                                                      listen: false)
                                                  .totalCoast +=
                                              (entry.value) *
                                                  (int.parse(entry.key['PRICE']
                                                      .toString()));
                                          Provider.of<CartItem>(context,
                                                  listen: false)
                                              .totalCoast += totalItemCost;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );
                      })),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Total price:   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      Text('\$ ${Provider.of<CartItem>(context).totalCoast.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.grey[600])),
                    ],
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)))),
                        backgroundColor: MaterialStatePropertyAll(kMainColor),
                        minimumSize:
                            MaterialStatePropertyAll(Size(screenWidth, 60))),
                    onPressed: () {
                      for (var product in products.entries) {
                        price = 0;
                        count = 0;
                        setState(() {
                          price = int.parse(product.key['PRICE']);
                          count = product.value;
                          totalPrice += price * count;
                        });
                      }
                      showCustomDialog(products, CartItemProvider.totalCoast);
                    },
                    child: Text('place order'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black))),
              ],
            );
          } else {
            return Center(
                child: Text('Cart is Empty ...'.toUpperCase(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
          }
        },
      ),
    );
  }

  void showCustomDialog(products, CartItemProvider) async {
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
            try {
              var docRef = _firestore.collection('Orders').doc();
              docRef.set({
                'ADDRESS': address,
                'TOTAL PRICE': CartItemProvider,
              });
              for (var product in products.entries) {
                docRef.collection('Order Details').doc().set({
                  'PRODUCT NAME': product.key['NAME'],
                  'PRODUCT PRICE': product.key['PRICE'],
                  'PRODUCT QUNTITY': product.value,
                  'PRODUCT IMAGE': product.key['IMAGE'],
                });
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                'Ordered successfully',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              )));
            } on FirebaseException catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                e.message!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              )));
            }
          },
          child: Text('Confirm'.toUpperCase()),
        )
      ],
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter your address'),
      ),
      title: Text('Total price = \$ $CartItemProvider'),
    );
    await showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
