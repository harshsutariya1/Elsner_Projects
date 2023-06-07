import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  String? name1, name2, name3; //optional variable
  LoginScreen({this.name1, this.name2, this.name3, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> list = ["1", "2", "3"];

  @override
  void initState() {
    //it will call before build method.
    super.initState();
    print(widget.name1);
    print(widget.name2);

    //widget.name = used to get variable values from parent class. only in stateful widgets.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screeen"),
      ),

      body: ListView.builder(
        itemCount: list.length, //loop will run this many times.
        itemBuilder: (context, index) {
          return Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => print(widget.name1),
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 50,
                      backgroundColor:
                          index % 2 == 0 ? Colors.amber : Colors.blue,
                    ),
                  ),
                ),
                Text(" index - $index")
              ],
            ),
          );
        },
      ),
    );
  }
}
