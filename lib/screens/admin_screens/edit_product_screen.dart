import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/sizedbox.dart';
import 'manage_product_screen.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'edit product screen';
  late String _name, _price, _category, _description, _image;
  EditProductScreen({Key? key}) : super(key: key);
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
            heightSizedbox(80),
            CustomTextField(
              myInit: product['NAME'],
              onClick: (value) {
                _name = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myInit: product['PRICE'],
              onClick: (value) {
                _price = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myInit: product['CATEGORY'],
              onClick: (value) {
                _category = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myInit: product['DESCRIPTION'],
              onClick: (value) {
                _description = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myInit: product['IMAGE'],
              onClick: (value) {
                _image = value!;
              },
            ),
            heightSizedbox(40),
            CustomButton(
              butTitle: 'Update Product',
              onClick: () async {
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  await FirebaseFirestore.instance
                      .collection('New Collection').doc(product.id.toString()).update({
                    'NAME': _name,
                    'PRICE': _price,
                    'CATEGORY': _category,
                    'DESCRIPTION': _description,
                    'IMAGE': _image
                  });
                }
                Navigator.pushNamed(context, ManageProductScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
