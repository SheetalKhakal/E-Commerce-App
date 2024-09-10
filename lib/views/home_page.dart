// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/services/data_service.dart';
import 'package:e_commerce_app/views/product_details_page.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedCategoryType = '';
  var _selectedSort = '';

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filterSortButtons(),
          SizedBox(height: 30), // Add spacing before the product list
          _productList(),
        ],
      ),
    );
  }

  Widget _filterSortButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDropdownMenu(
            hintText: "Filter",
            width: MediaQuery.of(context).size.width / 2.2,
            dropdownItems: [
              'Electronics',
              'jewelery',
              "men's clothing",
              "women's clothing"
            ],
            onChanged: (value) {
              setState(() {
                _selectedCategoryType = value!;
              });
            }),
        SizedBox(
          width: 8.0,
        ),
        CustomDropdownMenu(
            hintText: "Sort by",
            width: MediaQuery.of(context).size.width / 2.2,
            dropdownItems: [
              'Low to high price',
              'High to low price',
            ],
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
              });
            }),
      ],
    );
  }

  Widget _productList() {
    return Expanded(
      child: FutureBuilder<List<Product>?>(
        future: DataService()
            .getProducts(filter: _selectedCategoryType, sort: _selectedSort),
        builder: (context, snapshot) {
          // While waiting for data, show a loading spinner
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // If an error occurred, show an error message
          if (snapshot.hasError) {
            return Center(child: Text("Unable to load data."));
          }

          // If no data was found, show a message
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return Center(child: Text("No products found."));
          }

          // If data is available, display the list of products
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot
                .data!.length, // Set the item count to the number of products
            itemBuilder: (context, index) {
              Product product = snapshot.data![index]; // Access each product

              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(product: product);
                      },
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                isThreeLine: true,
                subtitle: Text(
                  "${product.category}\nPrice: ${product.price}",
                  style: getRegularStyle(color: ColorManager.black_text),
                ),
                leading: Image.network(product.image), // Product image
                title: Text(product.title,
                    style: getMediumStyle(color: ColorManager.black_text)),
                trailing: Text(
                  "${product.rating.rate.toString()} ⭐",
                  style: getRegularStyle(color: ColorManager.black_text),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
