import 'package:byte_password/homeScreen/Pbytes.dart';
import 'package:byte_password/models/localDB/dbHandler.dart';
import 'package:byte_password/widgets/ViewAllData.dart';
import 'package:byte_password/widgets/generateEmailPasswrdTabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

class PwdScreen extends StatefulWidget {
  final Animation<double> _animation;
  PwdScreen(this._animation);

  @override
  _PwdScreenState createState() => _PwdScreenState();
}

class _PwdScreenState extends State<PwdScreen> {
  List<Container> emailPass = [
    Container(
      child: Center(
          child: Text(
        '^ADD & VIEW EMAILS/PASSWORDS',
        style: GoogleFonts.pressStart2p(color: Colors.black87),
      )),
    )
  ];


  @override
  Widget build(BuildContext context) {
    EmailPassTabs tabs = new EmailPassTabs();
    final TextEditingController username = new TextEditingController();
    final TextEditingController password = new TextEditingController();
    DbHandler dbHandler = new DbHandler();
    var containerList=emailPass.toSet();
    DisplayInfo dataView=new DisplayInfo(emailPass);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("-----| Delete ALL!------------------>",
              style: GoogleFonts.arsenal(color: Colors.yellow)),
          actions: [
            IconButton(
              icon: RotationTransition(
                  turns: widget._animation,
                  child: Icon(
                Icons.restore_from_trash_outlined,
                color: Colors.red,
                size: 33,
              )),
              onPressed: () {
                dbHandler.clearDb();
                containerList.clear();


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
              },
            ),
          ],
        ),
        drawer: Drawer(
          elevation: 22,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffa9a9a9),
                ),
                child: Center(child: Text('BYTE PASSWORD SAFE')),
              ),
              SizedBox(
                height: 22,
              ),
              TextField(
                controller: username,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.orbitron(
                  color: Colors.black,
                ),
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 2),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30))),
                  hintText: 'ENTER EMAIL/USERNAME',
                  hintStyle: GoogleFonts.autourOne(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              TextField(
                controller: password,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
                style: GoogleFonts.orbitron(
                  color: Colors.black,
                ),
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 2),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30))),
                  hintText: 'ENTER PASSWORD',
                  hintStyle: GoogleFonts.autourOne(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Container(
                color: Color(0xffa9a9a9),
                child: Row(
                  children: [
                    SizedBox(
                      width: 23,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_sharp,
                        color: Colors.green,
                        size: 33,
                      ),
                      onPressed: () {
                        setState(() {
                          if (username.text.isNotEmpty &&
                              password.text.isNotEmpty) {
                            dbHandler.insertData(
                                username.text, password.text,);
                            emailPass.clear();// clears list before a list is displayed
                            containerList.clear();

                            for (int i = dbHandler.boxPassword.length - 1;
                                i >=0;
                                i--)
                              //int increment,List emailPass,var username,var password
                              tabs.addContainer(
                                  emailPass,
                                  dbHandler.boxEmail.getAt(i).toString(),
                                  dbHandler.boxPassword.getAt(i).toString());


                          }
                          return;
                        });
                      },
                    ),
                    SizedBox(
                      width: 158,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                        size: 22,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Pbytes()));
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.blue,
                onTap: () {},
                child: RotationTransition(
                  turns: widget._animation,
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(
                          'assets/keyspin.png',
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffa9a9a9),
        body: dataView
      ),
    );
  }
}
