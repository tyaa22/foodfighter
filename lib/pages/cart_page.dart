import 'package:flutter/material.dart';
import 'package:foodfighter/components/my_button.dart';
import 'package:foodfighter/components/my_cart_tile.dart';
import 'package:foodfighter/models/restaurant.dart';
import 'package:foodfighter/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Delete all items?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: const Text("Delete"))
                            ],
                          ));
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //list of items
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(child: Center(child: const Text("Nothing in here...")))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) =>
                                  MyCartTile(cartItem: userCart[index])))
                ],
              ),
            ),

            //checkout button
            MyButton(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage())), 
                text: "Checkout"),
            const SizedBox(height: 25,)
          ],
        ),
      );
    });
  }
}
