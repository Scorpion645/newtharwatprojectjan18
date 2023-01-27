import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/customButton.dart';
import 'add_product.dart';

class AdminHome extends StatelessWidget {
  static String id = 'admin home';

  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          SizedBox(height: 80,),
          CustomButton(buttonTitle: 'Add Product', onClick: (){
            Navigator.popAndPushNamed(context, AddProduct.id);
          }),
          SizedBox(height: 10,),
          CustomButton(buttonTitle: 'Edit Product', onClick: () {}),
          SizedBox(
            height: 10,
          ),
          CustomButton(buttonTitle: 'Orders review', onClick: () {}),
        ],
      ),
    );
  }
}
