import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardGeral extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomCardGeral({super.key, required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(imageUrl, fit: BoxFit.cover, width: 92, height: 92,),
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
                    style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSans( fontSize: 16, fontWeight: FontWeight.w300 ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}