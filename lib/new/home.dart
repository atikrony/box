// import 'package:flutter/material.dart';
// import 'customized_card.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int added = 0; // Move added variable inside the state class

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text(
//           "HOME",
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             CustomizedCard(
//               onCardTap: () {
//                 setState(() {
//                   added++;
//                 });
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // Print added here
//             Text(
//               "Added: $added",
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// home.dart

import 'package:flutter/material.dart';
import 'customized_card.dart';
import 'cart.dart'; // Import the cart file

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int added = 0;
  List<CartItem> cartItems = []; // Store the added items in the cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "HOME",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            CustomizedCard(
              onCardTap: () {
                setState(() {
                  added++;
                  // Add the item to the cart
                  cartItems.add(CartItem(
                    itemName: 'Item $added',
                    itemImage:
                        'assets/images/', // Change this to your item image path
                  ));
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Added: $added",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the cart page with the cart items
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cartItems),
                  ),
                );
              },
              child: const Text("View Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
