import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/Product.dart';
import '../../widgets/customButton.dart';
import 'Edit_product.dart';
import 'add_product.dart';

class AdminHome extends StatelessWidget {
  static String id = 'admin home';
  Map<String, dynamic> datas = {};
  List<Product> products = [];

  AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          SizedBox(
            height: 240,
          ),
          CustomButton(
              buttonTitle: 'Add Product',
              onClick: () {
                Navigator.popAndPushNamed(context, AddProduct.id);
              }),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              buttonTitle: 'Edit Product',
              onClick: () async {
                Navigator.popAndPushNamed(context, EditProduct.id);
                // var collection = FirebaseFirestore.instance.collection('Hello');
                // var querySnapshot = await collection.get();
                // for (var queryDocumentSnapshot in querySnapshot.docs) {
                //   datas = queryDocumentSnapshot.data();
                //   var CATEGORYYY = datas['CATEGORY'];
                //   var NAMEEE = datas['NAME'];
                //   print(datas);
                //   print('1 ' + NAMEEE);
                //   print(datas['CATEGORY']);
                //   products.add(Product(
                //       pCategory: datas['CATEGORY'],
                //       pDescription: datas['DESCRIPTION'],
                //       pImage: datas['IMAGE'],
                //       pName: datas['NAME'],
                //       pPrice: datas['PRICE']));
                //   print(products);
                // }
                // print(datas);
                // print('datas image  ' + datas['IMAGE']);
                // print(querySnapshot.docs.length);
                // print(products[0].pName);

              }),
          SizedBox(
            height: 10,
          ),
          CustomButton(buttonTitle: 'View Orders', onClick: () {}),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
