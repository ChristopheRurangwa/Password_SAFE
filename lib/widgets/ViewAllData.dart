import 'package:flutter/material.dart';

class DisplayInfo extends StatefulWidget {
  List ls;
DisplayInfo(this.ls);

  @override
  _DisplayInfoState createState() => _DisplayInfoState();
}

class _DisplayInfoState extends State<DisplayInfo> {
  @override
  Widget build(BuildContext context) {
    return displayEmlPwd();
  }

  ListView displayEmlPwd(){

    return ListView.builder(
        itemCount: widget.ls.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.ls[index];
        });
  }
}
