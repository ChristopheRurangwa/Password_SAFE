import 'dart:io';

import 'package:byte_password/models/localDB/dbHandler.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


import 'package:path_provider/path_provider.dart'as path_provider;
import 'homeScreen/Pbytes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory docuDire=await path_provider.getApplicationDocumentsDirectory();
  Hive.init(docuDire.path);


  return runApp(MaterialApp(

    home: Pbytes(),
    debugShowCheckedModeBanner: false,

  ));

}
