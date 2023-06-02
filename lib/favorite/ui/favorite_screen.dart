import 'package:flutter/material.dart';

import '../../utils/favorite_coffee_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
        return FavoriteCoffeeWidget();
      })),);
  }
}
