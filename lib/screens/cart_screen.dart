import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/cart_item.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    Map products = Provider.of<CartItem>(context).products;
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
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    products.keys.elementAt(index)['IMAGE'])),
                            title: Text(products.keys.elementAt(index)['NAME'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            subtitle: Text(
                                '\$ ${products.keys.elementAt(index)['PRICE']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Text('Count: '),
                                ClipOval(
                                  child: Material(
                                      color: kMainColor,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (products.values.elementAt(index) >
                                              1) {
                                            setState(() {
                                              prodCount--;
                                              Provider.of<CartItem>(context,
                                                      listen: false)
                                                  .addProduct(
                                                      products.keys
                                                          .elementAt(index),
                                                      prodCount);
                                            });
                                          }
                                        },
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Icon(Icons.remove, size: 18),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                      products.values.elementAt(index).toString(),
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
                                            Provider.of<CartItem>(context,
                                                    listen: false)
                                                .addProduct(
                                                    products.keys
                                                        .elementAt(index),
                                                    prodCount);
                                          });
                                        },
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Icon(Icons.add, size: 18),
                                        ),
                                      )),
                                ),

                                IconButton(
                                    onPressed: () {
                                      Provider.of<CartItem>(context,
                                              listen: false)
                                          .removeProduct(
                                              products.keys.elementAt(index));
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );

                        // GestureDetector(
                        //   onTap: () {

                        //   },
                        //   child: Container(
                        //     height: screenHeight * 0.15,
                        //     color: kSecondaryColor,
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(horizontal: 20),
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               CircleAvatar(
                        //                 radius: 40,
                        //                 backgroundImage: AssetImage(products.keys
                        //                     .elementAt(index)['IMAGE']),
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   SizedBox(
                        //                     height: 20,
                        //                   ),
                        //                   Text(
                        //                       products.keys
                        //                           .elementAt(index)['NAME'],
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 16)),
                        //                   SizedBox(
                        //                     height: 10,
                        //                   ),
                        //                   Text(
                        //                       '\$ ${products.keys.elementAt(index)['PRICE']}',
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.w500,
                        //                           fontSize: 16)),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           Column(
                        //             children: [
                        //               SizedBox(
                        //                 height: 20,
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Text('Count: '),
                        //                   Text(
                        //                       products.values
                        //                           .elementAt(index)
                        //                           .toString(),
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 16))
                        //                 ],
                        //               ),
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      })),
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
                    onPressed: () {},
                    child: Text('place order'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)))
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
}
