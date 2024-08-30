import 'package:foodfighter/models/food.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int qty;

  CartItem({
    required this.food,
    required this.selectedAddOns,
    this.qty = 1
  });

  double get totalPrice {
    double addOnPrice = selectedAddOns.fold(0, (sum, addon) => sum += addon.price);
    return (food.price + addOnPrice) * qty;
  }
}
