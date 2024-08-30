import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodfighter/models/cart_item.dart';
import 'package:foodfighter/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    //burgers
    Food(name: "Classic Cheeseburger",
        description: "Premium beef patty topped with cheddar cheese, lettuce, tomato, pickle and our handmade sauce",
        imagePath: "lib/assets/food/burgers/cheeseburger.png",
        price: 2.50,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: "Extra cheese", price: 0.99),
          AddOn(name: "Extra sauce", price: 0.50),
          AddOn(name: "No pickle", price: 0)
        ]),
    Food(name: "Double Cheeseburger",
        description: "Double version of our classic cheeseburger with double the goodness",
        imagePath: "lib/assets/food/burgers/doublecheeseburger.png",
        price: 3.50,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: "Extra cheese", price: 0.99),
          AddOn(name: "Extra sauce", price: 0.50),
          AddOn(name: "No pickle", price: 0)
        ]),
    Food(name: "Vegan Burger",
        description: "Vegan-friendly burger made with mushroom meat",
        imagePath: "lib/assets/food/burgers/veganburger.png",
        price: 2.99,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: "Extra cheese", price: 0.99),
          AddOn(name: "Extra sauce", price: 0.50),
          AddOn(name: "No pickle", price: 0)
        ]),
    Food(name: "Bacon and Egg Burger",
        description: "Delicious bacon paired with our patty complimented with warm egg",
        imagePath: "lib/assets/food/burgers/cheeseburger.png",
        price: 3.00,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: "Extra bacon", price: 0.99),
          AddOn(name: "Runny egg", price: 0),
          AddOn(name: "Cooked egg", price: 0)
        ]),
    Food(name: "Crispy Chicken Burger",
        description: "Juicy and crunchy chicken fillet combined with our secret sauce",
        imagePath: "lib/assets/food/burgers/crispychickenburger.png",
        price: 2.50,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: "Extra sauce", price: 0.50),
        ]),

    //salads
    Food(name: "Caesar Salad",
        description: "Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing",
        imagePath: "lib/assets/food/salads/caesarsalad.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: "Extra dressing", price: 0.50),
          AddOn(name: "Extra parmesan", price: 0.65),
          AddOn(name: "Add tuna", price: 0.45),
        ]),
    Food(name: "Caprese Salad",
        description: "Sliced tomatoes, fresh mozzarella, and basil, drizzled with olive oil and balsamic vinegar",
        imagePath: "lib/assets/food/salads/capresesalad.png",
        price: 1.50,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: "Extra dressing", price: 0.50),
          AddOn(name: "Extra vegetables", price: 0.40),
        ]),
    Food(name: "Egg Salad",
        description: "Chopped hard-boiled eggs, mayonnaise, mustard, and seasonings",
        imagePath: "lib/assets/food/salads/eggsalad.png",
        price: 0.65,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: "Extra seasoning", price: 0.50),
          AddOn(name: "Add bread", price: 0.35),
        ]),
    Food(name: "Greek Salad",
        description: "Tomatoes, cucumbers, olives, red onions, and feta cheese, dressed with olive oil and oregano",
        imagePath: "lib/assets/food/salads/greeksalad.png",
        price: 0.99,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: "Extra dressing", price: 0.50),
          AddOn(name: "Extra feta", price: 0.65),
        ]),
    Food(name: "Pasta Salad",
        description: "Creamy pasta salad with colorful vegetables",
        imagePath: "lib/assets/food/salads/pastasalad.png",
        price: 1.00,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: "No cucumber", price: 0),
        ]),

    //sides
    Food(name: "Bacon Fries",
        description: "Golden French fries topped with crispy bacon and drizzled with creamy sauce",
        imagePath: "lib/assets/food/sides/baconfries.png",
        price: 2.50,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: "Extra sauce", price: 0.10),
          AddOn(name: "Extra bacon", price: 0.30),
        ]),
    Food(name: "Chicken Nuggets",
        description: "4 pieces of crispy chicken nuggets, served with a side of tangy dipping sauce",
        imagePath: "lib/assets/food/sides/chickennugget.png",
        price: 3.50,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: "6 pieces", price: 0.50),
          AddOn(name: "8 pieces", price: 0.60),
        ]),
    Food(name: "French Fries",
        description: "Perfectly cooked, golden French fries",
        imagePath: "lib/assets/food/sides/frenchfries.png",
        price: 0.50,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0.15),
          AddOn(name: "Large size", price: 0.20),
        ]),
    Food(name: "Garlic Bread",
        description: "Warm, crispy slices of garlic bread, richly buttered and infused with savory garlic and herbs",
        imagePath: "lib/assets/food/sides/garlicbread.png",
        price: 2.00,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: "5 pieces", price: 0.10),
          AddOn(name: "Extra sauce", price: 0.10),
        ]),
    Food(name: "Onion Rings",
        description: "Golden, crispy onion rings with a light, crunchy batter, encasing sweet and tender onion centers",
        imagePath: "lib/assets/food/sides/onionrings.png",
        price: 2.50,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: "Extra sauce", price: 0.10),
          AddOn(name: "Extra bacon", price: 0.30),
        ]),

    //desserts
    Food(name: "Apple Pie",
        description: "A warm, flaky apple pie filled with sweet, cinnamon-spiced apples, offering a classic homemade comfort",
        imagePath: "lib/assets/food/desserts/applepie.png",
        price: 2.20,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: "Caramel sauce", price: 1.00),
          AddOn(name: "Ice cream", price: 1.00),
          AddOn(name: "Whipped cream", price: 0.5)
        ]),
    Food(name: "Brownies",
        description: " Rich, fudgy brownies with a dense, chocolatey center and a slightly crisp top, perfect for indulgent treats",
        imagePath: "lib/assets/food/desserts/brownie.png",
        price: 2.20,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: "Fresh berries", price: 1.50),
          AddOn(name: "Ice cream", price: 1.00),
          AddOn(name: "Chocolate sauce", price: 0.5)
        ]),
    Food(name: "Cheesecake",
        description: "A smooth and creamy cheesecake with a buttery graham cracker crust, offering a rich and tangy dessert experience",
        imagePath: "lib/assets/food/desserts/cheesecake.png",
        price: 2.20,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: "Fresh berries", price: 1.50),
          AddOn(name: "Caramel sauce", price: 1.00),
          AddOn(name: "Chocolate sauce", price: 0.5)
        ]),
    Food(name: "Cookies and Cream Ice Cream",
        description: "Creamy vanilla ice cream mixed with crunchy chunks of chocolate cookies, creating a classic and delightful treat",
        imagePath: "lib/assets/food/desserts/icecream.png",
        price: 1.50,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: "Sprinkles", price: 0.50),
        ]),
    Food(name: "Red Velvet Cake",
        description: "A slice of rich, velvety red velvet cake with a hint of cocoa, layered with smooth cream cheese frosting for a perfectly decadent treat",
        imagePath: "lib/assets/food/desserts/redvelvet.png",
        price: 2.30,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: "Ice cream", price: 1.00),
          AddOn(name: "Whipped cream", price: 0.5)
        ]),

    //drinks
    Food(name: "Apple Juice",
        description: "Refreshing apple juice with a crisp and naturally sweet flavor, perfect for any time of the day",
        imagePath: "lib/assets/food/drinks/applejuice.png",
        price: 1.00,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0),
          AddOn(name: "Large size", price: 0.5)
        ]),
    Food(name: "Cola",
        description: "A classic, fizzy cola with a bold and invigorating taste, offering a timeless refreshment",
        imagePath: "lib/assets/food/drinks/cola.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0),
          AddOn(name: "Large size", price: 0.5)
        ]),
    Food(name: "Iced Tea",
        description: "A chilled glass of iced tea, lightly sweetened ",
        imagePath: "lib/assets/food/drinks/icedtea.png",
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0),
          AddOn(name: "Large size", price: 0.5)
        ]),
    Food(name: "Lemonade",
        description: "Refreshing, tangy drink made from freshly squeezed lemons, water, and a touch of sweetness",
        imagePath: "lib/assets/food/drinks/lemonade.png",
        price: 1.00,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0),
          AddOn(name: "Large size", price: 0.5)
        ]),
    Food(name: "Mineral Water",
        description: "Bottled mineral water to quench thirst",
        imagePath: "lib/assets/food/drinks/mineralwater.png",
        price: 0.30,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: "Medium size", price: 0),
          AddOn(name: "Large size", price: 0.5)
        ]),
  ];

  /*
  getters
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  operations
   */
  List<CartItem> _cart = [];
  //add to cart
  void addToCart(Food food, List<AddOn> selectedAddOns) {
    //check if the same item already added
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddOns = ListEquality().equals(item.selectedAddOns, selectedAddOns);

      return isSameFood && isSameAddOns;
    });

    //add item qty if already exist
    if(cartItem != null) {
      cartItem.qty++;
    }
    else{
      _cart.add(
        CartItem(food: food, selectedAddOns: selectedAddOns)
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1) {
      if(_cart[cartIndex].qty > 1) {
        _cart[cartIndex].qty--;
      }
      else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double totalPrice = 0.0;

    for(CartItem item in _cart) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for(CartItem item in _cart) {
      totalItemCount += item.qty;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  helpers
   */
  //generate receipt
  String generateReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt...");
    receipt.writeln();

    String formattedDate = DateFormat("yyyy-MM-DD HH:mm:ss").format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------");

    for(final cartItem in _cart) {
      receipt.writeln("${cartItem.qty} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddOns.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddOns(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //turn double value to money
  String _formatPrice(double price) {
    return "\$" + price.toStringAsFixed(2);
  }

  //format addons to string summary
  String _formatAddOns(List<AddOn> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(",");
  }
}