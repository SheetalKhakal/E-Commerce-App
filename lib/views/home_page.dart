// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/services/data_service.dart';
import 'package:e_commerce_app/views/product_details_page.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategoryType = 'Electronics';
  String _categoryFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "E-Commerce App"),
      body: SafeArea(
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          _filterSortButtons(),
          //   SizedBox(height: 10), // Add spacing before the product list
          //  _productList(),
        ],
      ),
    );
  }

  Widget _filterSortButtons() {
    return Row(
      children: [
        Text("Filter"),
        Text("Filter"),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            hintText: "_selectedCategoryType",
            hintStyle: getRegularStyle(
              color: ColorManager.black_text,
              fontSize: FontSize.s16,
            ),
          ),
          value: _selectedCategoryType,
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategoryType = newValue!;
            });
            // if ( onChanged != null) {
            //    onChanged!(
            //       newValue); // Call the callback with the new value
            // }
          },
          items: [
            'Electronics',
            'jewelery',
            "men's clothing",
            "women's clothing"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          style: getRegularStyle(
            color: ColorManager.black_text,
            fontSize: FontSize.s16,
          ),
        ),
        // CustomDropdownMenu(
        //     labelText: "Filter by Category",
        //     hintText: "_selectedCategoryType",
        //     dropdownItems: [
        //       'Electronics',
        //       'jewelery',
        //       "men's clothing",
        //       "women's clothing"
        //     ],
        //     onChanged: (value) {
        //       // setState(() {
        //       //   _selectedCategoryType = value!;
        //       // }
        //       // );
        //     }),
        // SizedBox(width: 10),
        //   _sortButton(),
      ],
    );
  }

  Widget _productList() {
    return Expanded(
      child: FutureBuilder(
        future: DataService().getProducts(),
        builder: (context, snapshot) {
          return Container();

          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // }

          // if (snapshot.hasError) {
          //   return Center(child: Text("Unable to load data."));
          // }

          // if (!snapshot.hasData || snapshot.data == null) {
          //   return Center(child: Text("No products found."));
          // }

          // return ListView.builder(
          //   shrinkWrap: true,
          //   //  itemCount: snapshot.data!,
          //   itemBuilder: (context, index) {
          //     Product product = snapshot.data!;
          //     return ListTile(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return ProductDetailsPage(
          //                 product:
          //                     product, // Passing the selected product to the HomePage
          //               );
          //             },
          //           ),
          //         );
          //       },
          //       contentPadding: EdgeInsets.only(top: 20.0),
          //       isThreeLine: true,
          //       subtitle:
          //           Text("${product.category}\nPrice: ${product.price}"),
          //       leading: Image.network(product.image),
          //       title: Text(product.title),
          //       trailing: Text(
          //         "${product.rating.rate.toString()} ⭐",
          //         style: getRegularStyle(color: ColorManager.black_text),
          //       ),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
