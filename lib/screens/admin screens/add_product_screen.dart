import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class AddProductScreen extends StatelessWidget {
  static String id = 'add product screen';
  late String _name, _price, _description, _category, _image;
  AddProductScreen({Key? key}) : super(key: key);
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
              myHint: 'Add product name',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _price = value!;
              },
              myHint: 'Add product price',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _category = value!;
              },
              myHint: 'Add product category',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _description = value!;
              },
              myHint: 'Add product description',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _image = value!;
              },
              myHint: 'Add product image',
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              butTitle: 'Add product',
              onClick: () async{
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('Hello').add({
                    'NAME': _name,
                    'PRICE': _price,
                    'DESCRIPTION': _description,
                    'CATEGORY': _description,
                    'IMAGE': _image
                  });
                } else{
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
