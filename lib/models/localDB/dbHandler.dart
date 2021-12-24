import 'dart:developer';

import 'package:hive/hive.dart';

class DbHandler {
  final String blackBox = "blackBox";
  final String columnId = "id";
  final String columnEmail = "emails";
  final String columnPwd = "passwords";
  final String columnPcod = "passcode";
  late Box boxPassword = Hive.box("blackBox");
  late Box boxEmail = Hive.box("greenBox");
  late Box boxPasscode = Hive.box("blueBox");

  DbHandler() {
    Hive.openBox(blackBox);
    Hive.openBox("greenBox");
    Hive.openBox("blueBox");
    log("BOXES 1 2 3 INITIALIZED.....");
  }

  void insertPassCode(String passCode) {
    if(passCode.isNotEmpty||passCode.toString()!=""||passCode.length!=0||passCode!=""){

    if(boxPasscode.isNotEmpty&&boxPasscode.getAt(0)!=passCode){
      log(boxPasscode.containsKey(passCode).toString()+"<<>>=====");
      clearDBandPassCod();
    }
    boxPasscode.add(passCode);
    for(int i=0;i<=boxPasscode.length-1;i++) {
      log(boxPasscode.getAt(i).toString() +" "+i.toString()+ " <=CODE===0==}");



    }


  }
  }

  void insertData(String emails, String passwords) async {

      boxPassword.add(passwords);
      boxEmail.add(emails);



    log(validate(4564).toString() + "<======}");
    log(boxPasscode.getAt(0).toString() + "<====0==}");
  }


  validate(val) {
    //4564

    var temp = "init-01010101010101010101010101010101";
    try {
      for (int i = 0; i < boxPasscode.length-1; i++) {
        if (boxPasscode.getAt(i) == val.toString()) {
          temp = boxPasscode.getAt(i);
          log(temp.toString());
        }
      }
    } catch (e) {
      log("ERROR===>" + e.toString());
    }
    return temp;
  }

  void clearDb() {
    boxPassword.clear();
    boxEmail.clear();
  }
 void clearDBandPassCod(){
    clearDb();
    boxPasscode.clear();

 }
}
