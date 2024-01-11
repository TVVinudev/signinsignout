import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signinsignout/first.dart';

Future Createuser(_username,_password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _username.text, password: _password.text);
    print('sucessfully completed');
  }
  catch(e){
    print(e);
  }
}

