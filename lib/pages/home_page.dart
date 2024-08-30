import 'package:flutter/material.dart';
import 'package:foodfighter/components/my_current_location.dart';
import 'package:foodfighter/components/my_description_box.dart';
import 'package:foodfighter/components/my_drawer.dart';
import 'package:foodfighter/components/my_food_tile.dart';
import 'package:foodfighter/components/my_sliver_app_bar.dart';
import 'package:foodfighter/components/my_tab_bar.dart';
import 'package:foodfighter/models/food.dart';
import 'package:foodfighter/models/restaurant.dart';
import 'package:foodfighter/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //filter menu by category
  List<Food> _filterMenuByCategory(FoodCategory foodCategory, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == foodCategory).toList();
  }

  //get foods from a category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> foodByCategory = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: foodByCategory.length,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final food = foodByCategory[index];
            //return FoodTile UI
            return MyFoodTile(
              food: food,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodPage(food: food)))
            );
          });
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    //current location
                    MyCurrentLocation(),

                    //description box
                    MyDescriptionBox(),
                  ],
                )
            )
          ],
          body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                  controller: _tabController,
                  children: getFoodInThisCategory(restaurant.menu)
              ),
          )
      ),
    );
  }
}