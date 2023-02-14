import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/signup_button.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'Edit product';
// const EditProductScreen ({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Object? product = ModalRoute.of(context)?.settings.arguments;
    late String _name, _price, _description, _category, _image;

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
              myHint: '${product.toString()}',
              onClick: (value) {
                // print('${product[0].toString()}');
                _name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product.toString()}',
              onClick: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product.toString()}',
              onClick: (value) {
                _description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product.toString()}',
              onClick: (value) {
                _category = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: '${product.toString()}',
              onClick: (value) {
                _image = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            SignupButton(
              buttonTitle: 'ُEdit Product',
              onClick: () {
                print(product);
                print(product);
                // if (_globalKey.currentState!.validate()) {
                //   FirebaseFirestore.instance
                //       .collection('Jackets')
                //       .doc(product.toString())
                //       .update({
                //     'NAME': _name,
                //     'PRICE': _price,
                //     'CATEGORY': _category,
                //     'DESCRIPTION': _description,
                //     'IMAGE': _image,
                //   });
                // } else {
                //   print('error happened');
                // }
                // Navigator.pushNamed(context, ManageProductScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
