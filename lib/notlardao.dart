
import 'package:notes/Notlar.dart';
import 'package:notes/databasehelper.dart';

class Notlardao {

  Future<List<Notlar>> tumNotlar() async{
    var db = await Databasehelper.databaseErisim();
    
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notlar");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Notlar(id: satir["id"], ders: satir["ders"], vize: satir["vize"], finalnot: satir["finalnot"]);
    });
  }

  Future<void> notEkle(String ders, int vize, int finalnot) async{
    var db = await Databasehelper.databaseErisim();
    
    var bilgiler = <String, dynamic>{};

  bilgiler = {
    "ders": ders,
    "vize": vize,
    "final": finalnot,
  };

  await db.insert("notlar", bilgiler);
  }


  Future<void> notUpdate(int id, String ders, int vize, int finalnot) async{
    var db = await Databasehelper.databaseErisim();
    
    var bilgiler = <String, dynamic>{};

  bilgiler = {
    "ders": ders,
    "vize": vize,
    "final": finalnot,
  };

  await db.update(
    "notlar",
    bilgiler,
    where: "id = ?",
    whereArgs: [id],
  );

}

  Future<void> notDelete(int id) async{
    var db = await Databasehelper.databaseErisim();

  await db.delete(
    "notlar",
    where: "id = ?",
    whereArgs: [id],
  );

}




}