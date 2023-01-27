import 'package:flutter/material.dart';

import '../../firebase_auth/Store.dart';
import '../../models/product.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class AddProduct extends StatelessWidget {
  static String id = 'add product';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late String productName,
      productPrice,
      productDescription,
      productCategory,
      productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            CustomTextField(
              onClick: (value) {
                productName = value;
              },
              myHint: 'Enter product name',
              hintcolor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                productPrice = value;
              },
              myHint: 'Enter product price',
              hintcolor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                productDescription = value;
              },
              myHint: 'Enter product description',
              hintcolor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                productCategory = value;
              },
              myHint: 'Enter product category',
              hintcolor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                productImage = value;
              },
              myHint: 'Enter product image',
              hintcolor: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonTitle: 'Add product',
                onClick: () {
                  if (_globalKey.currentState!.validate()) {
                    Store().addProduct(Product(
                        Pcategory: productCategory,
                        Pdescription: productDescription,
                        Pimage: productImage,
                        Pname: productName,
                        Pprice: productPrice));
                  }
                })
          ],
        ),
      ),
    );
  }
}
