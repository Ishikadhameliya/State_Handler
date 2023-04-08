import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:state_handler/views/screens/products_page.dart';

import 'cart_page.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

late TabController tabController;
int initialTabIndex = 1;

class _home_pageState extends State<home_page> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.green,
        controller: tabController,
        initialActiveIndex: initialTabIndex,
        items: const [
          TabItem(icon: Icons.favorite, title: 'Like'),
          TabItem(icon: Icons.home, title: 'home_page'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart')
        ],
        onTap: (int i) {
          setState(() {
            initialTabIndex = i;
          });
        },
      ),
      body: IndexedStack(
        index: initialTabIndex,
        children: const [
          Center(
            child: Text("favorite"),
          ),
          Productpage(),
          cart_page(),
        ],
      ),
    );
  }
}