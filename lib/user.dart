import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prata2/repository/auth_repository.dart';
import 'Insertuser.dart';
import 'package:http/http.dart' as http;


class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);


  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

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
      appBar: AppBar(title: const Text("List Data User")),
      body: ListView.builder(itemCount: listUser.length, itemBuilder: (context,index){
        return Card(
          margin: EdgeInsets.all(2


          ),
          child: ListTile(
            leading: const Icon(CupertinoIcons.person_2_alt, color: Colors.red, size: 18),
            title: Text(listUser[index]["username"],style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.orange)),
            subtitle: Text(listUser[index]["email"],style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color:Colors.green)),
            trailing: Row(mainAxisSize: MainAxisSize.min,
              children: [
                IconButton( icon: const Icon(CupertinoIcons.delete_solid,color: Colors.orange ,),onPressed: (){
                  deleteDataUser(listUser[index]["id"]);
                },),
                IconButton( icon: const Icon(CupertinoIcons.arrow_down_doc_fill,color: Colors.orange ,),onPressed: (){},)],
            ),
          ),
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:
              (context)=> InsertUser()),
          );
        },
        splashColor: Colors.red,
        backgroundColor: Colors.orange,
        mini: true,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );


  }
}
