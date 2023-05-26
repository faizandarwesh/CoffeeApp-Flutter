import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final String price;

  const DetailScreen(
      {required this.title, required this.image, required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    var counter = 1;
    var isFavorite = false;

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(children: [
              //Coffee image
              SizedBox(
                width: double.infinity,
                height: screenSize.height * 0.55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              const SizedBox(
                height: 10,
              ),

              //Coffee title and favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite!=isFavorite;
                        });
                      }, icon:  Icon(isFavorite == true ? Icons.favorite :  Icons.favorite_border,size: 32,))
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //Ratings and description
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "A cappuccino is an espresso-based coffee drink that is traditionally prepared with steamed milk foam. Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder. Presenting to you the Coffee Delivery App incorporated with some trending color schemes!Feel free to give me some feedback.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 16,
              ),

              //Pricing and Add to Cart Button
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\$ ',
                              style: GoogleFonts.poppins(
                                  fontSize: 24, color: Colors.orange)),
                          TextSpan(
                              text: widget.price,
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                        ],
                      ),
                    ),   
                    
                    //Counter button         
                    Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: HexColor("#e5ddd8"),),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              if(counter>1){
                                counter--;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color:Colors.orange,
                            size: 16,
                          )),
                      Container(           
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '$counter',
                          style: const TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              counter++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 16,
                          )),
                    ],
                  ),
                ),
                   
                   //Add to Cart Button
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: HexColor("#e5ddd8")))),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#e5ddd8")),
                      ),
                      onPressed: () {},
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown),
                          )),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
