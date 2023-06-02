import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/home/model/coffee.dart';
import 'package:demoapp/utils/constants.dart';

class FirebaseService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<Coffee>> getProducts() async {
    CollectionReference coffeeReference =
        firestore.collection(Constants.coffeeCollection);

    QuerySnapshot coffeeSnapshot = await coffeeReference.get();
    return [
      ...coffeeSnapshot.docs.map((data) => Coffee.fromJson(
          {'id': data.id, ...data.data() as Map<String, dynamic>}))
    ];
  }

  static Future<List<Coffee>> getFavorites() async {
    CollectionReference favoriteReference = firestore.collection(Constants.coffeeCollection);

    QuerySnapshot coffeeSnapshot = await favoriteReference.get(); 

    print(coffeeSnapshot);
   return [
      ...coffeeSnapshot.docs.map((data) => Coffee.fromJson(
          {'id': data.id, ...data.data() as Map<String, dynamic>}))
    ];
  }

  static Future<void> addToFavorites(String productId, bool isFavorite) async {
    await firestore
        .collection(Constants.coffeeCollection) //  collection name
        .doc(productId) // Use the user's ID as the document ID
        .update({"isFavorite": isFavorite})
        .then((value) => print('Product added to favorites'))
        .catchError(
            (error) => print('Failed to add product to favorites: $error'));
  }
}
