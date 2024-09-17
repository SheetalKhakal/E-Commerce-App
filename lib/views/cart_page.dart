// ignore_for_file: prefer_const_constructors

import 'dart:convert'; // For JSON encoding/decoding
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/views/home_page.dart';

// Cart Item Model
class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});

  // Convert CartItem to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  // Convert Map to CartItem
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}

// Cart Page Widget
class CartPage extends StatefulWidget {
  final Product? product;

  CartPage({this.product});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart') ?? '[]';
    final List<dynamic> jsonList = json.decode(cartData);
    setState(() {
      _cartItems =
          jsonList.map((jsonItem) => CartItem.fromMap(jsonItem)).toList();
    });
    _addProductIfNeeded();
  }

  void _addProductIfNeeded() {
    if (widget.product != null) {
      final existingIndex =
          _cartItems.indexWhere((item) => item.name == widget.product!.title);
      if (existingIndex == -1) {
        setState(() {
          _cartItems.add(CartItem(
            name: widget.product!.title,
            price: widget.product!.price,
          ));
          _saveCart();
        });
      } else {
        // Optional: Update the quantity if the product already exists
        setState(() {
          _cartItems[existingIndex].quantity++;
          _saveCart();
        });
      }
    }
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _cartItems.map((item) => item.toMap()).toList();
    final cartData = json.encode(jsonList);
    await prefs.setString('cart', cartData);
  }

  void _increaseCount(int index) {
    setState(() {
      _cartItems[index].quantity++;
      _saveCart();
    });
  }

  void _decreaseCount(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
        _saveCart();
      }
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _cartItems.removeAt(index);
      _saveCart();
    });
  }

  void _checkout() {
    // Handle checkout logic here
    ToastMessage.show("Checkout successfuly");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: _cartItems.isEmpty
                  ? Center(child: Text("No items in the cart"))
                  : ListView.builder(
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        final item = _cartItems[index];
                        // Calculate the total price based on quantity
                        final totalPrice = item.price * item.quantity;
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First Row: Item Name
                              Text(item.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),

                              SizedBox(height: 8), // Spacing between rows

                              // Second Row: Increment/Decrement and Delete buttons with Price
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Increment/Decrement buttons inside Rounded Container
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          30), // Rounded corners
                                      border: Border.all(
                                          color: ColorManager
                                              .black_text), // Border color
                                    ),
                                    width:
                                        140, // Adjusted width to fit the buttons
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () =>
                                              _decreaseCount(index),
                                        ),
                                        Text('${item.quantity}'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () =>
                                              _increaseCount(index),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Delete Button Outside Rounded Container
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => _deleteProduct(index),
                                  ),

                                  // Item Price
                                  Text(
                                    "${totalPrice.toStringAsFixed(2)}", // Showing the total price with 2 decimal places
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(
              buttonText: "Checkout",
              onPressed: _checkout,
            ),
          ),
        ],
      ),
    );
  }
}
