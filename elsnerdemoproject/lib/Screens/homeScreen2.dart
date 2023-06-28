// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// class ApiData {
//   String? fact;
//   int? length;
//
//   ApiData({this.fact, this.length});
//
//   ApiData.fromJson(Map<String, dynamic> json) {
//     fact = json['fact'];
//     length = json['length'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fact'] = this.fact;
//     data['length'] = this.length;
//     return data;
//   }
// }

// Future<List<Map>> fetchCats() async {
//   final response = await http.get(Uri.parse("https://catfact.ninja/fact"));
//   if (response.statusCode == 200) {
//     // The request was successful.
//     print("status code = 200.");
//     var jsonData = jsonDecode(response.body);
//     print("json data fetched. $jsonData");
//     print("Map intialized.");
//     Map fact = {
//       "fact": jsonData["fact"],
//       "length": jsonData["length"],
//     };
//     print("Map Created");
//     List<Map> facts = [fact];
//     print("list of map created");
//     return facts;
//   } else {
//     print("api fetching failed.");
//     // The request failed.
//     throw Exception('Failed to load api...');
//   }
// }

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Api Example")),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("api example"),
            ],
          ),
        ),
      ),
    );
  }
}
