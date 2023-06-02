import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/coffee.dart';
import '../../utils/coffee_tile.dart';
import '../../utils/special_coffee_tile.dart';

class CoffeeListingScreen extends StatelessWidget {
  const CoffeeListingScreen({
    super.key,
    required this.coffeeData,
  });

  final List<Coffee> coffeeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header for the coffee tagline
          Text("Find the best \ncoffee for you",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.w600),),
          const SizedBox(height: 16,),

          //Search bar
              TextField(decoration: InputDecoration (
                enabledBorder:OutlineInputBorder(
              borderSide: const  BorderSide(color:Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
           ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
            color: Colors.orange,
            width: 1.0),
            ),
            hintText: "Find your coffee....",
            suffixIcon: const Icon(Icons.search),
          ),),
          const SizedBox(height: 32,),

          //Coffee tile
            Expanded(child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeData.length,
              itemBuilder: (context,index){
                return CoffeeTile(
                  id: coffeeData[index].id,
                  title: coffeeData[index].title,
                   image: coffeeData[index].imageUrl, 
                   price: coffeeData[index].price.toString());
              }),),

          //Special coffee tile
          const SizedBox(height: 16,),
           Text("Special for you",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),),
           const SizedBox(height: 16,),
           const SpecialCoffeeTile(title: "5 Coffee Beans You \n Must Try!", image: "images/coffeecorn.jpg")
        ],
      ),
    );
  }
}