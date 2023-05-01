
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titulo() {
  return GoogleFonts.nunito(
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
}
TextStyle subTitulo() {
  return GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );
}
TextStyle texto() {
  return GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );
}
TextStyle textoAppBar() {
  return GoogleFonts.nunito(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}
TextStyle textoBotao() {
  return GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );
}
TextStyle textoBotaoVermelho() {
  return GoogleFonts.nunito(
    color: Colors.red,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );
}
TextStyle tituloFooter() {
  return GoogleFonts.nunito(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );
}
TextStyle textoFooter() {
  return GoogleFonts.nunito(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );
}

//cores
extension CustomColors on Colors {
  static const Color colorLaranja = Color(0xFFFF9021);
  static const Color colorRoxa = Color(0xFF9156E7);
  static const Color colorAmarelo = Color(0xFFE8AF35);
  static const Color colorAzulEscuro = Color(0xFF325B9C);             // #325B9C
  static const Color colorAzulClaro = Color(0xFF0093FD);  
}