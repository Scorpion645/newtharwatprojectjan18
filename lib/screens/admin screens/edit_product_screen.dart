import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_Button.dart';
import '../../widgets/custom_TextField.dart';
import 'manage_products_screen.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product screen';

  EditProductScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)?.settings.arguments;
    late String _name, _price, _description, _category, _image;
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
              myInitVal: product['NAME'].toString(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _price = value!;
              },
              myInitVal: product['PRICE'].toString(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _category = value!;
              },
              myInitVal: product['CATEGORY'].toString(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _description = value!;
              },
              myInitVal: product['DESCRIPTION'].toString(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onClick: (value) {
                _image = value!;
              },
              myInitVal: product['IMAGE'].toString(),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              butTitle: 'Edit product',
              onClick: () async {
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  print(product.toString());
                  await FirebaseFirestore.instance
                      .collection('Hello')
                      .doc(product.id.toString()).update({
                    'NAME': _name,
                    'PRICE': _price,
                    'DESCRIPTION': _description,
                    'CATEGORY': _description,
                    'IMAGE': _image
                  });
                  Navigator.pushNamed(context, ManageProductScreen.id);
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
