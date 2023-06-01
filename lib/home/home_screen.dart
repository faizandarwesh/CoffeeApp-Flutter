import 'package:demoapp/cart/cart_screen.dart';
import 'package:demoapp/favorite/favorite_screen.dart';
import 'package:demoapp/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/coffee_controller.dart';
import 'coffee_listing_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // Get coffee controller reference
    ref.read(coffeeNotifier.notifier).getCoffee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coffeeData = ref.watch(coffeeNotifier);

    int selectedIndex = 0;

    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    void onPageChanged(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    void onNavTapped(int index) {
      pageController.jumpToPage(index);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Coffee Shop"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        onTap: onNavTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 32,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 32,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32,
              ),
              label: ""),
        ],
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: [
          CoffeeListingScreen(coffeeData: coffeeData),
          const FavoriteScreen(),
          const CartScreen(),
          const NotificationScreen()
        ],
      ),
    );
  }
}
