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

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiData {
  String fact;
  int length;
  ApiData({required this.fact, required this.length});

  // List<Map<String, dynamic>> mapingapidata() {
  //   return [{"fact": fact, "length": length}];
  // }
}

Future fetchCats() async {
  final response = await http.get(Uri.parse("https://catfact.ninja/fact"));

  if (response.statusCode == 200) {
    // The request was successful.
    print("status code = 200.");
    var jsonData = jsonDecode(response.body);
    // print("json data fetched.");

    // for (var index in jsonData) {
    //   print("Adding data into list index : $index");
    //   ApiData ad = ApiData(fact: index["fact"], length: index["length"]);
    //   datas.add(ad.fact);
    // }
    print("list intialized.");
    List facts = [];
    facts.add(jsonData["fact"]);
    print("list created. length = ${facts.length}");
    return facts;
  } else {
    print("api fetching failed.");
    // The request failed.
    return null;
  }
}

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  List catFact = [];

  Future<void> _refreshData() async {
    print("refreshing data");
      
    catFact = await fetchCats();
    
    print("done:$catFact");
  }

  @override
  void initState() {
    super.initState();
    _refreshData().then((value) {
      print("done refreshing");
    }).catchError((error) {
      print("we catch error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          itemCount: catFact.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(catFact[index]),
            );
          },
        ),
      ),
    );
  }
}
