// class ApiExample extends StatelessWidget {
//   ApiExample({super.key});
//   Future<String>? _data;
//   Future<String> fetchedData() async {
//     final responce = await http.get(Uri.parse("https://catfact.ninja/fact"));
//     if (responce.statusCode == 200) {
//       Fluttertoast.showToast(msg: "responce successful");
//       return responce.body;
//     } else {
//       Fluttertoast.showToast(msg: "throws exception...");
//       throw Exception("Faild to fetch data...");
//     }
//   }
//   @override
//   void initState() {
//     _data = fetchedData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("API Example"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _data,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               Fluttertoast.showToast(msg: "it has data");
//               return Text("${snapshot.data}");
//             } else if (snapshot.hasError) {
//               Fluttertoast.showToast(msg: "it has error");
//               return Text("${snapshot.error}");
//             } else {
//               Fluttertoast.showToast(msg: "it has nothing");
//               return const CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCalling {
  String? fact;
  int? length;

  ApiCalling({this.fact, this.length});

  ApiCalling.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fact'] = this.fact;
    data['length'] = this.length;
    return data;
  }
}

Future<List<ApiCalling>?> fetchCats() async {
  final response = await http.get(Uri.parse("https://catfact.ninja/fact"));

  if (response.statusCode == 200) {
    // The request was successful.
    print("status code = 200");
    final jsonData = jsonDecode(response.body);
    print("json data created");
    List<ApiCalling> cats = [];
    print("list initialized");
    try {
      for (var cat in jsonData) {
        cats.add(ApiCalling.fromJson(cat));
      }
    print("list created");
    } catch (Exception) {
      print("list creation failed");
    }
    return cats;
  } else {
    print("api failed");
    // The request failed.
    return null;
  }
}

class ApiExample extends StatefulWidget {
  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  List<ApiCalling> cats = [];

  Future<void> _refreshData() async {
      print("refreshed data");
    setState(() async {
      cats = (await fetchCats())!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${cats[index].fact}"),
            );
          },
        ),
      ),
    );
  }
}
