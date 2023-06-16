
import 'package:flutter/material.dart';

// ________________________________________________________________________________________
// __________________________SignUp_Screen_________________________________________________
// ________________________________________________________________________________________

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign-Up",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.red,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(children: [
          
        ]),
      ),
    );
  }
}
// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________
