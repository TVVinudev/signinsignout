import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signinsignout/functions.dart';
void main(){
  runApp(MaterialApp(
    home: hh(),
  ));
}


class hh extends StatelessWidget {
  const hh({super.key});

  Future signout() async{
    try{
      await FirebaseAuth.instance.signOut();
      print('sign out');

    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: TextButton(onPressed: (){
                signout();
        }, child: Text('signout',style: TextStyle(color: Colors.white,fontSize: 30),)),
      ) ,
    );
  }
}