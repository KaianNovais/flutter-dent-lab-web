import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color color;

   const CustomCard(
      {Key? key,
      required this.title,
      required this.color,
      required this.subtitle,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 12, 
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                color: color,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 92,
                    height: 92,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}