import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailPassTabs {
  void addContainer(List emailPass,var username,var password) {
    Divider(
      thickness: 34,
    );
    emailPass.add(Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white54,
          border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 1,
              ))),
      height: 142,
      width: 123,
      child: Row(
        children: [
          SizedBox(
            width: 9,
          ),
          Column(
            children: [
              SizedBox(
                height: 23,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(''),
                  SizedBox(
                    width: 29,
                  ),
                  Text("USERNAME/EMAIL"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 65,
                color: Colors.black,
                width: 207,
                child: Center(
                    child: Text(
                  username,
                  style: GoogleFonts.autourOne(color: Colors.white),
                )),
              ),
            ],
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            children: [
              SizedBox(
                height: 23,
              ),
              Text('PASSWORD'),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 65,
                color: Colors.black,
                width: 165,
                child: Center(
                    child: Text(
                  password,
                  style: GoogleFonts.autourOne(color: Colors.white),
                ),),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
