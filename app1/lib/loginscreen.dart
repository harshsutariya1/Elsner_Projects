import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> list = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Screeen"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              "${list[index]}",
              style: TextStyle(
                fontSize: 50,
                backgroundColor: index%2==0?Colors.amber:Colors.blue,

              ),
            ),
          );
        },
      ),
    );
  }
}
