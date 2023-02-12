import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/signup_button.dart';
import 'Manage_product_screen.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product';
// const EditProductScreen ({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dynamic? product = ModalRoute.of(context)?.settings.arguments;
    late String _name, _price, _description, _category, _image, _id;

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
              myHint: '${product[1]['NAME'].toString()}',
              onClick: (value) {
                // print('${product[0].toString()}');
                _name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product[0]['PRICE'].toString()}',
              onClick: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product[0]['DESCRIPTION'].toString()}',
              onClick: (value) {
                _description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product[0]['CATEGORY'].toString()}',
              onClick: (value) {
                _category = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product[0]['IMAGE'].toString()}',
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
                print(product[0]['NAME']);
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
