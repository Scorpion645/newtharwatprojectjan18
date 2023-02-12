import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/signup_button.dart';
import 'Manage_product_screen.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product';
// const EditProductScreen ({Key? key}) : super(key: key);
  late String _name, _price, _description, _category, _image, _id;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            CustomTextField(
              myHint: 'Add product name',
              onClick: (value) {
                _name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Add product price',
              onClick: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Add product ID',
              onClick: (value) {
                _id = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Add product description',
              onClick: (value) {
                _description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Add product category',
              onClick: (value) {
                _category = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Add product image',
              onClick: (value) {
                _image = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            SignupButton(
              buttonTitle: 'Add Product',
              onClick: () {
                if (_globalKey.currentState!.validate()) {
                  FirebaseFirestore.instance
                      .collection('Hello')
                      .doc(product)
                      .update({
                    'NAME': _name,
                    'PRICE': _price,
                    'CATEGORY': _category,
                    'DESCRIPTION': _description,
                    'IMAGE': _image,
                  });
                }
                ;
                Navigator.pushNamed(context, ManageProductScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
