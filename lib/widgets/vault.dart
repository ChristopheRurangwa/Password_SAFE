import 'dart:developer';

import 'package:byte_password/homeScreen/Pbytes.dart';
import 'package:byte_password/models/localDB/dbHandler.dart';

import 'package:byte_password/models/passwords/pwdScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'formFields.dart';

class Vault extends StatefulWidget {
  final Animation<double> _animation;
  late final TextEditingController typedCode;
  late final TextEditingController setCode;
  Vault(this._animation, this.typedCode, this.setCode);


  @override
  State<Vault> createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  CodeHandler inputs = CodeHandler();

  DbHandler dbHandler=new DbHandler();




  @override
  void dispose() {
    dbHandler.boxPasscode.compact();
    dbHandler.boxPasscode.close();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 422,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: AssetImage(
          'assets/strongbox.png',
        ),
      )),
      child: Center(
        child: Column(
          children: [
            GestureDetector(

              onTap: () {


setState(() {



  log("====> LOGIN AND SETUP");
  if (widget.typedCode.text.toLowerCase() ==
      dbHandler.validate(widget.typedCode.text.toLowerCase())) {

    Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) =>
                  PwdScreen(widget._animation),
              transitionsBuilder: (a, anim, c, child) =>
                  FadeTransition(
                    opacity: anim,
                    child: child,
                  ),
              transitionDuration:
              Duration(milliseconds: 2522),
            ));


  }
                var target=0;

                if(widget.setCode.text.toLowerCase().isNotEmpty){
                  target=1;
                }
                else target=2;

                  switch(target){

                    case 1:{
                      if (widget.setCode.text.toLowerCase().isNotEmpty) {

                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (a, b, c) => Pbytes(),
                              transitionsBuilder: (a, anim, c, child) =>
                                  FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),
                              transitionDuration:
                              Duration(milliseconds: 3522),
                            ));

                          dbHandler.insertPassCode(widget.setCode.text.toLowerCase().toString());



                        log(widget.setCode.text.toString()+"=====!");
                        widget.setCode.clear();

                        log("SIGNUP!!!");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xffa9a9a9),
                            content: Text(
                              "Set Passcode 3X, then enter passcode.",
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.green, fontSize: 19),
                            ),
                            duration: const Duration(milliseconds: 59000),
                          ),
                        );

                      }

                      break;
                    }
                    case 2:{
                      if (widget.setCode.text.toLowerCase().isEmpty &&
                          widget.typedCode.text.toLowerCase().isEmpty
                          ||widget.typedCode.text.toString()
                              !=dbHandler.validate(widget.typedCode.text.toString())){

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xffa9a9a9),
                            content: Text(
                              "Please set up a code... ALL data will be DELETED!",
                              style: GoogleFonts.pressStart2p(color: Colors.red),
                            ),
                            duration: const Duration(milliseconds: 6000),
                          ),
                        );
                      }
                      break;
                    }
                    default:{
                      log("The switch value was empty!!!");
                    }

                  }

});

              },
              child: RotationTransition(
                turns: widget._animation,
                child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        'assets/silverwheel.png',
                      ),
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
