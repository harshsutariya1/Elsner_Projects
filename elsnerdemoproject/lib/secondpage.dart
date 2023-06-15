//First page after login...
// Gallery

// import 'package:elsnerdemoproject/firstPage.dart';
import 'package:elsnerdemoproject/loginFunctionality.dart';
import 'package:elsnerdemoproject/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  void getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("Username");
    });
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  String? name = "";

  final List images = [
    "map.jpg",
    "triangle.jpg",
    "cube.jpg",
    "moon.jpg",
    "infinity.jpg",
    "mountains.jpg",
    "fox.jpg",
    "car.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
// ________________________________________________________________________________________
// ________________________________________________________________________________________
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "$name",
            overflow: TextOverflow.fade,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  LoginFunctionality().clearLoginData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Welcome()));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
// ________________________________________________________________________________________
// ________________________________________________________________________________________
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 1));
          },
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              // Have to use expanded widget with listview inside column.
              Expanded(
                child: ListView.separated(
                  itemCount: images.length,
                  // ___________________________________________________________________
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 5,
                    );
                  },
                  // ___________________________________________________________________
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ImageShow("assets/${images[index]}")),
                              );
                              // showDialog(
                              //   context: context,
                              //   builder: ((BuildContext context) {
                              //     return AlertDialog(
                              //       content: Image.asset("${images[index]}"),
                              //       contentPadding: const EdgeInsets.all(2),
                              //       actionsPadding: const EdgeInsets.all(0),
                              //       actions: [
                              //         IconButton(
                              //             onPressed: () {
                              //               Navigator.of(context).pop();
                              //             },
                              //             icon: const Icon(
                              //               Icons.cancel,
                              //               color: Color.fromARGB(111, 0, 0, 0),
                              //             )),
                              //       ],
                              //     );
                              //   }),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/${images[index]}",
                                width: 180,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Image: ${index + 1}",
                              ),
                            ),
                            Text(
                              "${images[index]}",
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
// ________________________________________________________________________________________
// ________________________________________________________________________________________
      ),
    );
  }
}

// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________
class ImageShow extends StatelessWidget {
  ImageShow(
    this.image, {
    super.key,
  });
  String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 244, 67, 54),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(child: Image.asset("$image")),
        ),
      ),
    );
  }
}
// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________
