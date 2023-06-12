//First page after login...

import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List images = [
    "bike.jpg",
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
                  return const Divider(
                    thickness: 5,
                    color: Color.fromARGB(100, 244, 67, 54),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            return AlertDialog(
                              content: Image.asset("${images[index]}"),
                              contentPadding: const EdgeInsets.all(2),
                              actionsPadding: const EdgeInsets.all(0),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Color.fromARGB(111, 0, 0, 0),
                                    )),
                              ],
                            );
                          }),
                        );
                      },
                      child: Image.asset(
                        "${images[index]}",
                        height: 100,
                      ),
                    ),
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
