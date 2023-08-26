import 'package:flutter/material.dart';
import 'dart:async';
import 'package:prata2/Welcome.dart';
import 'package:prata2/blocs/Auth_bloc.dart';
import 'package:prata2/repository/auth_repository.dart';
import 'package:prata2/view/LoginPage.dart';
import 'package:prata2/view/main.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async{
    var duration = const Duration(seconds: 8);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => App(authRepository: AuthRepository(), authBloc: AuthBloc(authRepository: AuthRepository()))),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Icon(Icons.account_tree_outlined,
              size: 100,
              color:  Colors.white,),

            SizedBox(height: 24,),

            Text("S M A R T  L O C K" ,
              style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),),

          ],
        ),
      ),
    );
  }
}

