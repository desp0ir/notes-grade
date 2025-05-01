import 'package:flutter/material.dart';
import 'package:notes/main.dart';

class NotKayit extends StatefulWidget {
  const NotKayit({super.key});

  @override
  State<NotKayit> createState() => _NotKayitState();
}

class _NotKayitState extends State<NotKayit> {
  @override
var tfders = TextEditingController();
var tfvize = TextEditingController();
var tffinalnot = TextEditingController();

Future<void> kayit(String ders, int vize, int finalnot) async {
  print("$ders- $vize- $finalnot kayit edildi");

  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));

}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("not kayıt"),
        backgroundColor: Colors.blue,
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

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: (){
          kayit(tfders.text, int.parse(tfvize.text), int.parse(tffinalnot.text));
        },
        label: Text(
          "kaydet",
          style: 
            TextStyle(fontSize: 18, color: Colors.black),
          ),
      ),
    );
  }
}