import 'package:flutter/material.dart';

import '../../firebase_auth/Store.dart';
import '../../models/product.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class AddProductScreen extends StatelessWidget {
  static String id = 'Add product screen';
   String Pname = '', Pprice='', Pdescription='', Pcategory='', Pimage='';
 
  final _store = Store();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomTextField(
              onClick: (value) => Pname = value,
              myHint: 'Enter product name',
              myHintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) => Pprice = value,
              myHint: 'Enter product price',
              myHintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) => Pdescription = value,
              myHint: 'Enter product description',
              myHintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) => Pcategory = value,
              myHint: 'Enter product category',
              myHintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) => Pimage = value,
              myHint: 'Enter product image',
              myHintColor: Colors.black,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
                buttonTitle: 'Add Product',
                onClick: () {
                  if (_globalKey.currentState!.validate()) {
                    _store.addProduct(Product(
                        category: Pcategory,
                        description: Pdescription,
                        image: Pimage,
                        name: Pname,
                        price:Pprice));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
