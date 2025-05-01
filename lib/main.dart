import 'package:flutter/material.dart';
import 'package:notes/Notlar.dart';
import 'package:notes/not_detay.dart';
import 'package:notes/not_kayit.dart';
import 'package:notes/notlardao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notlar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<List<Notlar>> tumNotlar() async{
  var notlarlist = await Notlardao().tumNotlar();

  return notlarlist;
}


//Future<bool> appExit() async{
//exit(0);
//}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("notlar uygulaması", style: TextStyle(color: Colors.black,),),

            FutureBuilder<List<Notlar>>( 
              future: tumNotlar(),
              builder: (contect, snapshot){
                if(snapshot.hasData){
                  var notlarlist = snapshot.data;

                  double ort = 0.0;

                  if(notlarlist != null && notlarlist.isNotEmpty){
                    double toplam = 0.0;


                  for(var n in notlarlist){
                    toplam = toplam + (n.vize+ n.finalnot)/2;
                  }

                  ort = toplam / notlarlist.length;

                  }
                  
                  return Text("ortlama: 0, ${ort.toInt()}");
                                  
                }else{
                  return Text("ortlama: 0");
                }


              }   
            )
          ],
        )
      ),
      body: FutureBuilder(
        future: tumNotlar(),
        builder: (contect, snapshot){
          if(snapshot.hasData){
            var notlarlist = snapshot.data as List<Notlar>;


            return ListView.builder(
              itemCount: notlarlist.length,
              itemBuilder: (context, indeks){
                var not = notlarlist[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotDetay(not: not)));

                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(not.ders),
                          Text(not.vize.toString()),
                          Text(not.finalnot.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
        ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotKayit()));
        },
         child: const Icon(Icons.add),
        ),
    );
  }
}
