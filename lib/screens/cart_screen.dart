import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/cart_products.dart';
import '../widgets/sizedbox.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart screen';

  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    dynamic totalPrice = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('My Title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<CartProducts>(context).cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                dynamic product = Provider.of<CartProducts>(context)
                    .cartProducts
                    .keys
                    .elementAt(index);
                int prodPrice = int.parse(product['PRICE']);
                int prodCount = Provider.of<CartProducts>(context)
                    .cartProducts
                    .values
                    .elementAt(index);
                int totProdCost = prodCount * prodPrice;
                int _quantity = prodCount;

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                          Provider.of<CartProducts>(context)
                              .cartProducts
                              .keys
                              .elementAt(index)['IMAGE']),
                    ),
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width * 0.17,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product['NAME'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              heightSizedbox(5),
                              Text('\$ ${product['PRICE']}',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: kMainColor,
                                      shape: BoxShape.circle),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_quantity > 0) {
                                          _quantity == prodCount;
                                          _quantity--;
                                          Provider.of<CartProducts>(context,
                                                  listen: false)
                                              .cartProducts
                                              .addEntries({
                                            MapEntry(product, _quantity)
                                          });
                                          Provider.of<CartProducts>(context,
                                                  listen: false)
                                              .calculateCost(context);
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 12,
                                    )),
                              ]),
                              Text(
                                  Provider.of<CartProducts>(context)
                                      .cartProducts
                                      .values
                                      .elementAt(index)
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)),
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: kMainColor,
                                      shape: BoxShape.circle),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _quantity == prodCount;
                                        _quantity++;
                                        Provider.of<CartProducts>(context,
                                                listen: false)
                                            .cartProducts
                                            .addEntries(
                                                {MapEntry(product, _quantity)});
                                        Provider.of<CartProducts>(context,
                                                listen: false)
                                            .calculateCost(context);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 12,
                                    )),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      alignment: Alignment.centerLeft,

                      child: Row(
                        children: [
                          Text('\$ ${(prodPrice * prodCount).toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      //
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('Total:  \$ ${Provider.of<CartProducts>(context).totalCost.toString()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.grey[600])),
          ),
          // Text(totalPrice.toString()),
        ],
      ),
    );
  }
}
