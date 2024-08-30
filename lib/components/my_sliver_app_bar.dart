import 'package:flutter/material.dart';
import 'package:foodfighter/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {

  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title
  });


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      pinned: true,
      floating: false,
      actions: [
        //cart button
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: child),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: 0, right: 0, left: 0),
        expandedTitleScale: 1,
      ),
    );
  }}