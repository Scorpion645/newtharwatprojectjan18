import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_Button.dart';
import '../../widgets/custom_TextField.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product screen';
  late String _name, _price, _description, _category, _image;
  EditProductScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            CustomTextField(
              onClick: (value) {
                _name = value!;
              },
              myHint: 'Edit product name',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _price = value!;
              },
              myHint: 'Edit product price',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _category = value!;
              },
              myHint: 'Edit product category',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _description = value!;
              },
              myHint: 'Edit product description',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _image = value!;
              },
              myHint: 'Edit product image',
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              butTitle: 'Edit product',
              onClick: () async {
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('Hello').add({
                    'NAME': _name,
                    'PRICE': _price,
                    'DESCRIPTION': _description,
                    'CATEGORY': _description,
                    'IMAGE': _image
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Data is missing, something went wrong',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
