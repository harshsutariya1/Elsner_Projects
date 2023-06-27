import 'package:elsnerdemoproject/Functionality/elsnerLogo.dart';
import 'package:elsnerdemoproject/homeScreen2.dart';
// import 'package:elsnerdemoproject/homeScreen2.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreen.dart';
import 'Functionality/loginFunctionality.dart';
import 'signupScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiExample(),
    );
  }
}

// __________________________________________________________________________________________
// ______________________________Splash_Screen_______________________________________________
// __________________________________________________________________________________________

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      LoginFunctionality().checkLoginStatus(ctx: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 253, 253, 0.73),
              Color.fromARGB(130, 255, 17, 0),
            ],
          ),
        ),
        child: const Center(child: ElsnerLogo()),
      ),
    ));
  }
}
// __________________________________________________________________________________________
// ___________________________________Welcome_Screen_________________________________________
// __________________________________________________________________________________________

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ElsnerLogo(),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Welcome!\n\nLet's find you some services.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 100,
              ),
// __________________________________________________________________________________________
// _________________________________Buttons__________________________________________________
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red.withOpacity(0.25),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                spreadRadius: 5)
                          ],
                          color: const Color.fromARGB(255, 255, 7, 7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 5,
                              // offset: ()
                            )
                          ],
                          color: const Color.fromARGB(255, 53, 49, 35),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Sign UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
// __________________________________________________________________________________________
// __________________________________________________________________________________________
            ],
          ),
        ),
      ),
    );
  }
}
// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________
