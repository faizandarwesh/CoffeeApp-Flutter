import 'package:demoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  const CoffeeTile(
      {required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    //coffee image
    return InkWell(
      onTap: () => context.pushNamed(Constants.detailScreenRoute,
          queryParameters: {"title": title, "image": image, "price": price}),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.grey[800],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Coffee Image
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 8,
          ),

          //Coffee title
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          //Coffee Price
          Row(
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
                        text: price,
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.orange,
                ),
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
