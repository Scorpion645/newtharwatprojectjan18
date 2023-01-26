import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/product.dart';
import '../../services/store.dart';
import '../../widgets/customTextField.dart';

class AddProduct extends StatelessWidget {
  static String id = 'add product';
  late String _name, _price, _description, _category, _imageLocation;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Form(
          key: _globalKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              CustomTextField(
                myHint: 'Product name',
                myObscuredText: false,
                onClick: ((value) => _name = value),
                myColor: kMainColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Product price',
                myObscuredText: false,
                onClick: ((value) => _price = value),
                myColor: kMainColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Product description',
                myObscuredText: false,
                onClick: ((value) => _description = value),
                myColor: kMainColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Product category',
                myObscuredText: false,
                onClick: ((value) => _category = value),
                myColor: kMainColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Product location',
                myObscuredText: false,
                onClick: ((value) => _imageLocation = value),
                myColor: kMainColor,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _store.AddProduct(Product(
                          pCategory: _category,
                          pDescription: _description,
                          pLocation: _imageLocation,
                          pName: _name,
                          pPrice: _price));
                    }
                  },
                  child: Text('Add Product'))
            ],
          ),
        ),
      ),
    );
  }
}
