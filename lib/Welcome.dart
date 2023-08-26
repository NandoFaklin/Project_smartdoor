import 'package:flutter/material.dart';
import 'package:prata2/Dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prata2/blocs/Auth_bloc.dart';
import 'package:prata2/event/auth_even.dart';
import 'package:prata2/state/auth_state.dart';

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  void _showModalBottomSheet(BuildContext context) {



    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children:   [
              Padding(padding: EdgeInsets.fromLTRB(15,10,15,10),
                child: Text("Register",style : TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.lightBlueAccent),textAlign: TextAlign.center,),

              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10),),),
                      labelText: "User Name",
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.account_circle,size: 18,),
                      )

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10),),),
                      labelText: "Password",
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.ac_unit_sharp,size: 18,),
                      )

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10),),),
                      labelText: "Comfirm Password",
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.ac_unit_sharp,size: 18,),
                      )

                  ),
                ),
              ),

              SizedBox(height: 18,),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width - 2 * - 2,
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:
                      (context)=> DashboardApp(nameuser: 'nameuser',password: 'password',
                  )),
                  );
                },child: Text("Create Acount"),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?", style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: (){
                      _showModalBottomSheetlogin(context);
                    },child: Text("Login"),
                  )
                ],
              ),

            ],
          ),
        );
      },
    );
  }

  void _showModalBottomSheetlogin (BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children:   [
              Padding(padding: EdgeInsets.fromLTRB(15,10,15,20),
                child: Text("Login",style : TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.lightBlueAccent),textAlign: TextAlign.center,),

              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10),),),
                      labelText: "User Name",
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.account_circle,size: 18,),
                      )

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10),),),
                      labelText: "Password",
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.ac_unit_sharp,size: 18,),
                      )

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container (
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: (BorderRadius.circular(3))),
                      ),
                      SizedBox(width: 0,),
                      Text("Remember me", style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  Text("Forgot Password ?", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width - 2 * - 2,
                child: ElevatedButton(onPressed: (){
                },child: Text("Login"),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not have an account ?", style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: (){
                      _showModalBottomSheet(context);
                    },child: Text("register"),
                  )
                ],
              )



            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
          children: [
            Image.asset('images/imagesatu.png',height: 333,fit: BoxFit.fill,),
            SizedBox(height: 15,),
            Text("Welcome",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.lightBlueAccent),textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            Text("Smart lock bisa membantu anda meningkatkan keamanan rumah anda dengan sangat baik dan mudah",style: const TextStyle(fontSize: 12, color:Colors.black),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * - 2,
              child: ElevatedButton(onPressed: (){
                _showModalBottomSheet(context);
              },child: Text("Create Acount"),),
            ),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * - 2,
              child: ElevatedButton(onPressed: (){
                _showModalBottomSheetlogin(context);
              },child: Text("Login"),),
            ),

          ],
        ),
      ),
    );
  }
}
