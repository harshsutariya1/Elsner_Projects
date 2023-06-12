import 'firstpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}


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
              Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                       Text(
                        "UN",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 209, 140, 140),
                              offset: Offset(1.0, 5.0),
                              blurRadius: 5
                            )
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,
                          color: Colors.red,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "BIND",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 109, 92, 92),
                              offset: Offset(1,5),
                              blurRadius: 5
                            )
                          ],
                          decoration: TextDecoration.overline,
                          decorationColor: Colors.red,

                          decorationThickness: 2,
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Welcome! Let's find you some services.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()));
                    },
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}