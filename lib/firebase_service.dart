import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/coffee.dart';
import 'package:demoapp/utils/constants.dart';

class FirebaseService{

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<Coffee>> getProducts() async{
    CollectionReference coffeeRef = firestore.collection(Constants.coffeeCollection);

    QuerySnapshot coffeeSnapshot = await coffeeRef.get();
    return [...coffeeSnapshot.docs.map((data) => Coffee.fromJson({
      'id' : data.id,
      ...data.data() as Map<String, dynamic>}))];

  }
}