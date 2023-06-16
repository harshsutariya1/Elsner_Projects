//Login and SignUp screens.

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

import 'loginFunctionality.dart';
import 'homeScreen.dart';

// ________________________________________________________________________________________
// ____________________________Login_Screen________________________________________________
// ________________________________________________________________________________________

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// _____________________________________________________________________________
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String? helpertext = "";
  Color? helpercolor = Colors.blue;

  void emailvalidatingtext(String email) {
    setState(() {
      if (EmailValidator.validate(email)) {
        helpertext = "Valid Email";
        helpercolor = Colors.blue;
      } else {
        helpertext = "Invalid Email";
        helpercolor = Colors.red;
      }
    });
  }

  bool passwordCheck(String pass) {
    return pass != "" ? true : false;
  }

  void onsubmit() {
    if (EmailValidator.validate(username.text) &&
        passwordCheck(password.text)) {
      LoginFunctionality()
          .saveLoginData(username: username.text, password: password.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Listview(),
        ),
      );
      Fluttertoast.showToast(
        msg: "Login Successful!",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(msg: "Enter valid Email or Password!!");
    }
  }

// _____________________________________________________________________________
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.red,
      ),
      // extendBody: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/userLoginIcon.png",
                height: 200,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Username",
                    hintText: "Enter Your Email.",
                    helperText: helpertext,
                    helperStyle: TextStyle(color: helpercolor),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  controller: username,
                  onChanged: (value) {
                    emailvalidatingtext(value);
                  },
                  onSubmitted: (value) => setState(() {
                    if (value != "" && EmailValidator.validate(value)) {
                      helpertext = "";
                    }
                  }),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Password",
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                  ),
                  controller: password,
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {
                  onsubmit();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
// ________________________________________________________________________________________
// ______________________Extra_Code________________________________________________________
// ________________________________________________________________________________________

class LoginDetails extends StatefulWidget {
  LoginDetails({super.key, this.username, this.password});
  String? username = "name", password = "pass";
  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Login Details."),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Username: ${widget.username}"),
              Text("Password: ${widget.password}"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Login Sucessful!!!",
                    backgroundColor: Colors.red,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Listview()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text("Next Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
