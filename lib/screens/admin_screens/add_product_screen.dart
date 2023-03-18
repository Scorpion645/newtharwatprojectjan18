import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/sizedbox.dart';

class AddProductScreen extends StatelessWidget {
  static String id = 'add product screen';
  late String _name, _price, _category, _description, _image;
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
            heightSizedbox(80),
            CustomTextField(
              myHint: 'Add product Name',
              onClick: (value) {
                _name = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myHint: 'Add product Price',
              onClick: (value) {
                _price = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myHint: 'Add product Category',
              onClick: (value) {
                _category = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myHint: 'Add product Description',
              onClick: (value) {
                _description = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myHint: 'Add product Image',
              onClick: (value) {
                _image = value!;
              },
            ),
            heightSizedbox(40),
            CustomButton(
              butTitle: 'Add Product',
              onClick: () async{
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                 await FirebaseFirestore.instance.collection('New Collection').add({
                    'NAME': _name,
                    'PRICE': _price,
                    'CATEGORY': _category,
                    'DESCRIPTION': _description,
                    'IMAGE': _image
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
