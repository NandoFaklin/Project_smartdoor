import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertUser extends StatefulWidget {
  const InsertUser({Key? key}) : super(key: key);

  @override
  State<InsertUser> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertUser> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();


  Future<void> InsertDataUser() async {

    String url = 'https://nandofaklin.000webhostapp.com/adduser.php';
    try {
      var response = await http.post(Uri.parse(url), body: {
        "username": _name.text.toString(),
        "password": _pass.text.toString(),
        "email": _email.text.toString(),
        "phone": _phone.text.toString(),
      });
      var insertUser = json.decode(response.body);
      if (insertUser == "true") {
        print("Data User baru berhasil ditambahkan");
      } else {
        print("Data User baru gagal ditambahkan");
      }
    } catch (exc) {
      print(exc);
    }
  }
  void clearText(){
    _name.clear();
    _pass.clear();
    _email.clear();
    _phone.clear();
  }

  String nama="";
  String pass="";
  String email="";
  String phone="";

  void setDataMahasiswa(){
    setState(() {
      nama= _name.text;
      pass= _pass.text;
      email= _email.text;
      phone= _phone.text;
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New User")),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                controller: _name,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "User Name",
                  labelStyle: TextStyle(fontSize: 27,
                    color:Colors.blue,),
                  hintText: "Input user name",
                  hintStyle: TextStyle(fontSize: 27,
                    color:Colors.black12,),
                  suffixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                    child: Icon(CupertinoIcons.person_2_alt,color: Colors.lightBlueAccent,),
                  ),filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,style: BorderStyle.solid),
                  ),

                ),
                maxLength: 40,



              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: _pass,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 27,
                    color:Colors.blue,),
                  hintText: "Passsword",
                  hintStyle: TextStyle(fontSize: 27,
                    color:Colors.black12,),
                  suffixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                    child: Icon(CupertinoIcons.padlock_solid,color: Colors.lightBlueAccent,),
                  ),filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,style: BorderStyle.solid),
                  ),
                ),
                obscureText: true,
                maxLength: 40,
              ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                controller: _email,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(fontSize: 27,
                    color:Colors.blue,),
                  hintText: "Email Address",
                  hintStyle: TextStyle(fontSize: 27,
                    color:Colors.black12,),
                  suffixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                    child: Icon(Icons.email,color: Colors.lightBlueAccent,),
                  ),filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,style: BorderStyle.solid),
                  ),

                ),
                maxLength: 40,

              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: _phone,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 27,
                      color:Colors.blue),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontSize: 27,
                      color:Colors.black12),
                  suffixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                    child: Icon(Icons.phone,color: Colors.lightBlueAccent),
                  ),filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,style: BorderStyle.solid),
                  ),
                ),
                maxLength: 40,
              ),
            ),

            SizedBox(height: 20,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle:
                TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                onPressed: () {
                  InsertDataUser();
                  clearText();

                },
                child: Text("Add User"),

              ),
            ),
          ],
        ),
      ),
    );
  }


}