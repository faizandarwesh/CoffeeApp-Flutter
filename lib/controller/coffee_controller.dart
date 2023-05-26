import 'package:demoapp/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../coffee.dart';

// global provider
final coffeeNotifier = StateNotifierProvider<CoffeeController, List<Coffee>>((ref) {
  return CoffeeController();
});

class CoffeeController extends StateNotifier<List<Coffee>>{
  
  CoffeeController():super([]);

  getCoffee() async {
   state = await FirebaseService.getProducts();
  }

}