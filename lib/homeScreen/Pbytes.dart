

import 'dart:ui';
import 'package:byte_password/widgets/vault.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pbytes extends StatefulWidget {
  @override
  _PbytesState createState() => _PbytesState();
}

class _PbytesState extends State<Pbytes> with TickerProviderStateMixin {
  late final AnimationController _control;
  final TextEditingController _inputCode = new TextEditingController();
  final TextEditingController _setCode = new TextEditingController();


  @override
  void initState() {

    super.initState();
    _control = AnimationController(

      duration: const Duration(seconds: 4,), vsync: this,
    )
      ..repeat(reverse: false);




  }
  late final Animation<double> _animation=CurvedAnimation(parent: _control, curve: Curves.elasticOut);


  @override
  void dispose() {
    _control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffa9a9a9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 78,),
            Center(
              child: SizedBox(
                width: 220,
                child:TextField(
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
                    labelText: "ENTER PASSCODE",
                    labelStyle: GoogleFonts.orbitron(color: Colors.white,fontWeight: FontWeight.bold),
                    hintStyle: GoogleFonts.pressStart2p(fontSize: 10,color: Colors.green,fontWeight: FontWeight.bold),
                  ),
                ),

                // inputs.enterCode(),
              ),
            ),

            Center(
              child: SizedBox(
                width: 220,
                child:TextField(
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
                    hintText: 'DELETES ALL DATA!',
                    labelText: "SET PASSCODE",
                    labelStyle: GoogleFonts.orbitron(color: Colors.white,fontWeight: FontWeight.bold),
                    hintStyle: GoogleFonts.pressStart2p(fontSize: 10,color: Colors.red,),
                  ),
                )

                //inputs.setUpCode(),
              ),
            ),

            SizedBox(height: 7,),

            Center(child: Text('---> Tap the handle!',style: GoogleFonts.orbitron(color: Colors.yellow,))),
            Divider(),

        Vault(_animation,_inputCode,_setCode),

            SizedBox(height: 106,),
            Divider(),
            Center(child: Text('BYTE PASSWORD SAFE', style: GoogleFonts.pressStart2p(fontWeight: FontWeight.normal,color: Colors.white))),


          ],
        ),
      ),
    );
  }
}