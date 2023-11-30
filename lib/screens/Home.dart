import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:login_auth/screens/signin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: Text("Home Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
    );
  }
}
