//First page after login...

import 'dart:ui';

import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  final List images = [
    "map.jpg",
    "triangle.jpg",
    "cube.jpg",
    "moon.jpg",
    "infinity.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("List View"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            // Have to use expanded widget with listview inside column.
            Expanded(
              child: ListView.separated(
                itemCount: images.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(thickness: 5,);
                },
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
    );
  }
}

class ImageShow extends StatelessWidget {
  ImageShow(
    this.image, {
    super.key,
  });
  String image = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 244, 67, 54),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(child: Image.asset("$image")),
        ),
      ),
    );
  }
}