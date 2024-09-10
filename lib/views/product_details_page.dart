// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/views/cart_page.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: Text('Product Details Page'),
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _productImage(context),
          _productDetails(context),
        ],
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.50,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(product.image),
        ),
      ),
    );
  }

  Widget _productDetails(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: getBoldStyle(color: ColorManager.black_text),
          ),
          Text(
            "Rating: ${product.rating.rate.toString()} ⭐ | ${product.rating.count} Reviews",
            style: getMediumStyle(color: ColorManager.black_text),
          ),
          Text(
            "${product.price}",
            style: getMediumStyle(color: ColorManager.black_text),
          ),
          Text(
            "Description",
            style: getMediumStyle(color: ColorManager.black_text),
          ),
          Text(
            product.description,
            style: getRegularStyle(color: ColorManager.grey),
          ),
          CustomElevatedButton(
              buttonText: "Add To Cart",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      product: product,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
