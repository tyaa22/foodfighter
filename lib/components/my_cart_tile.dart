import 'package:flutter/material.dart';
import 'package:foodfighter/components/my_quantity_control.dart';
import 'package:foodfighter/models/cart_item.dart';
import 'package:foodfighter/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  //food info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(cartItem.food.name),
                        width: 120,
                      ),
                      Text("\$" + cartItem.food.price.toString()),
                    ],
                  ),

                  const Spacer(),

                  //add or reduce qty
                  MyQuantityControl(
                      food: cartItem.food,
                      qty: cartItem.qty,
                      onIncrement: () {
                        restaurant.addToCart(
                            cartItem.food, cartItem.selectedAddOns);
                      },
                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      })
                ],
              ),
            ),

            //addon
            SizedBox(
              height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
              child: ListView(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddOns
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name),
                                Text(
                                  " (\$" + addon.price.toString() + ")",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )
                              ],
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 12),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            onSelected: (addon) {}),
                      ),
                    )
                    .toList(),
              ),
            )
          ]),
        );
      },
    );
  }
}
