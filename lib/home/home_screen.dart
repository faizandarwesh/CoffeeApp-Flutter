import 'package:demoapp/utils/coffee_tile.dart';
import 'package:demoapp/utils/special_coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/coffee_controller.dart';

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

    return Scaffold(
      
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Coffee Shop"),
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {  },),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 32,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size: 32,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 32,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,size: 32,),label: ""),
        ],
        ),
        body: Padding(
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
                      title: coffeeData[index].title,
                       image: coffeeData[index].imageUrl, 
                       price: coffeeData[index].price.toString());
                  }),),

              //   Expanded(child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: const [
              //     CoffeeTile(title: "Latte", image: "images/latte.jpg", price: "4.50"),
              //     CoffeeTile(title: "Cappucino", image: "images/cappucino.jpg", price: "4.60"),
              //     CoffeeTile(title: "Milk Coffee", image: "images/milkcoffee.jpg", price: "3.80"),
              //     CoffeeTile(title: "Black Coffee", image: "images/blackcoffee.jpg", price: "4.20")
              //     ],
              // )),


              //Special coffee tile
              const SizedBox(height: 16,),
               Text("Special for you",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),),
               const SizedBox(height: 16,),
               const SpecialCoffeeTile(title: "5 Coffee Beans You \n Must Try!", image: "images/coffeecorn.jpg")
            ],
          ),
        ),);
  }
}
