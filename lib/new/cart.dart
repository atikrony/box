// cart.dart

import 'package:flutter/material.dart';

class CartItem {
  final String itemName;
  final String itemImage;

  CartItem({
    required this.itemName,
    required this.itemImage,
  });
}

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              widget.cartItems[index].itemImage,
              height: 40,
              width: 40,
            ),
            title: Text(widget.cartItems[index].itemName),
          );
        },
      ),
    );
  }
}
