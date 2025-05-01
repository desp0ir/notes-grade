import 'package:flutter/material.dart';
import 'package:notes/Notlar.dart';
import 'package:notes/main.dart';

class NotDetay extends StatefulWidget {
  Notlar not;

  NotDetay({super.key, required this.not});


  @override
  State<NotDetay> createState() => _NotDetayState();
}

class _NotDetayState extends State<NotDetay> {



var tfders = TextEditingController();
var tfvize = TextEditingController();
var tffinalnot = TextEditingController();

Future<void> sil(int id) async {
  print("$id kayit edildi");

  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));

}

Future<void> guncelle(int id, String ders, int vize, int finalnot) async {
  print("$ders- $vize- $finalnot güncellendi");

  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));

}

  @override

  void initState(){
    super.initState();

    var not = widget.not;
    tfders.text =not.ders;
    tfvize.text = not.vize.toString();
    tffinalnot.text = not.finalnot.toString();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("not detay"),

        actions: [
          ElevatedButton(
            onPressed: (){
              sil(widget.not.id);
          }, child: Text("sil", style: TextStyle(color: Colors.white),)
          ),
          ElevatedButton(
            onPressed: (){
              guncelle(widget.not.id, tfders.text, int.parse(tfvize.text), int.parse(tffinalnot.text));
          }, child: Text("güncelle", style: TextStyle(color: Colors.white))
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tfders,
                decoration: InputDecoration(
                  hintText: "ders adı",
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: tfvize,
                decoration: InputDecoration(
                  hintText: "vize",
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: tffinalnot,
                decoration: InputDecoration(
                  hintText: "final",
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}