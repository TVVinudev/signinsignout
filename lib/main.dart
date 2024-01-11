import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signinsignout/firebase_options.dart';
import 'package:signinsignout/first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Log In'),
      routes:{
            'firstScreen' : (context) => hh(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();


  Future Signinuser() async{
    try{
     final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _username.text, password: _password.text);
      if(result != null)
      Navigator.of(context).pushNamed('firstScreen');
    }
    catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: _username,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _password,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Signinuser();
                  },
                  child: Container(
                    height: 40,
                    width: double.maxFinite,
                    child: Center(child: Text('Sign up',style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

