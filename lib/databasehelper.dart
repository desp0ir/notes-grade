import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import 'package:flutter/services.dart';

import 'dart:io';


class Databasehelper {

static final String databaseAdi = "notlar.db";

static Future<Database> databaseErisim() async{
  String dbYol = join(await getDatabasesPath(), databaseAdi);

  if(await databaseExists(dbYol)){
    print("db mevcut");

  } else{
    ByteData data = await rootBundle.load("database/$databaseAdi");

    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(dbYol).writeAsBytes(bytes, flush: true);

    print("db kopyalandı");
  }


  return openDatabase(dbYol);
}

}
