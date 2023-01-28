import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

class AddProduct extends StatelessWidget {
  static String id = 'add product';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late String Pname, Pprice, Pdescription, Pcategory, Pimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: 120,
            ),
            CustomTextField(
              onClick: (value) {
                Pname = value;
              },
              myHint: 'product name',
              hintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                Pprice = value;
              },
              myHint: 'product price',
              hintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                Pdescription = value;
              },
              myHint: 'product description',
              hintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                Pcategory = value;
              },
              myHint: 'product category',
              hintColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              onClick: (value) {
                Pimage = value;
              },
              myHint: 'product image',
              hintColor: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonTitle: 'Add Product',
                onClick: () {
                  if (_globalKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection('Hello').add({
                      'CATEGORY': Pcategory,
                      'DESCRIPTION': Pdescription,
                      'IMAGE': Pimage,
                      'NAME': Pname,
                      'PRICE': Pprice
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
