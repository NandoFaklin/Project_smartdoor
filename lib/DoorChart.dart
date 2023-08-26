import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pintu extends StatefulWidget {
  const Pintu({Key? key}) : super(key: key);

  @override
  State<Pintu> createState() => _PintuState();
}

class _PintuState extends State<Pintu> {
  List listUser=[];
  Future<void> ListDataUser() async{
    String url = "http://10.0.2.2/tesuas/listuser.php";
    try {
      var response= await http.get(Uri.parse(url));
      listUser= jsonDecode(response.body);
      setState(() {
        listUser= jsonDecode(response.body);
      });
    }catch(exc){
      print(exc);
    }
  }

  Future<void> deleteDataUser(String id) async {
    String url= "https://nandofaklin.000webhostapp.com/deleteuser.php";
    try{
      var urlparam = await http.post(Uri.parse(url), body: {"id":id});
      var response = jsonDecode(urlparam.body);
      if(response ["success"]=="true"){
        print("Delet data user sukses");
        ListDataUser();
      }else{
        print("hapus data");
      }
    }catch(exc){

    }
  }

  @override
  void initState(){
    ListDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pintu")),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset('images/pintu2.jpg',height: 333,fit: BoxFit.fill,),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Text(
                "Data User ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 450,
            width: 100,
            child: ListView.builder(itemCount: listUser.length, itemBuilder: (context,index){
              return Card(
                margin: EdgeInsets.all(2
                ),
                child: ListTile(
                  leading: const Icon(CupertinoIcons.arrow_right_circle_fill, color: Colors.lightBlueAccent, size: 18),
                  title: Text(listUser[index]["username"],style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.black)),
                  subtitle: Text(listUser[index]["email"],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color:Colors.red)),
                ),
              );
            },
            ),
          ),

        ]
      ),

    );


  }
}
