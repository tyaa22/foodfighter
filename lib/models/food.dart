class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<AddOn> availableAddOns;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddOns
  });
}

//food categories
enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class AddOn {
  String name;
  double price;

  AddOn({
    required this.name,
    required this.price
  });
}