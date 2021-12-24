import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeHandler {
  final TextEditingController _inputCode = new TextEditingController();
  final TextEditingController _setCode = new TextEditingController();

  Widget enterCode() {


    return TextField(
      controller: _inputCode,
      maxLength: 4,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: GoogleFonts.orbitron(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(const Radius.circular(30))),
        hintText: 'ENTER PASSCODE',
        hintStyle: GoogleFonts.pressStart2p(fontSize: 12),
      ),
    );
  }

  Widget setUpCode() {
    return TextField(
      controller: _setCode,
      maxLength: 4,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: GoogleFonts.orbitron(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(const Radius.circular(30))),
        hintText: 'Will clear all data!',
        hintStyle: GoogleFonts.pressStart2p(fontSize: 8,color: Colors.red),
      ),
    );
  }
 

}
