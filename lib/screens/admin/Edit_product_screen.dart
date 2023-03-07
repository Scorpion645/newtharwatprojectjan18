import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_TextField.dart';
import '../../widgets/signup_button.dart';
import 'Manage_product_screen.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product';
// const EditProductScreen ({Key? key}) : super(key: key);
  late String _name, _price, _description, _category, _image;
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
              myInitVal: product['NAME'].toString(),
              onClick: (value) {
                _name = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myInitVal: product['PRICE'].toString(),
              onClick: (value) {
                _price = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myInitVal: product['DESCRIPTION'].toString(),
              onClick: (value) {
                _description = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myInitVal: product['CATEGORY'].toString(),
              onClick: (value) {
                _category = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myInitVal: product['IMAGE'].toString(),
              onClick: (value) {
                _image = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            SignupButton(
              buttonTitle: 'Edit Product',
              onClick: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  FirebaseFirestore.instance.collection('Jackets').doc(product.toString()).update({
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
