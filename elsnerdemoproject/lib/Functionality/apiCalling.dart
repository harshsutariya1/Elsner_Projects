// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key, required this.api});
  final String api;
  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  @override
  void initState() {
    super.initState();
    _data = fetchedData();
  }

  Future<String>? _data;
  Future<String> fetchedData() async {
    final responce = await http.get(Uri.parse(widget.api));
    if (responce.statusCode == 200) {
      print("responce successful");
      return responce.body;
    } else {
      print("throws exception...");
      throw Exception("Faild to fetch data...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("API Example"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: _data,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print("it has data");
                      return Text("${snapshot.data}");
                    } else if (snapshot.hasError) {
                      print("it has error");
                      return Text("${snapshot.error}");
                    } else {
                      print("it is loading...");
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatApi {
  String? fact;
  int? length;

  CatApi({this.fact, this.length});

  CatApi.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fact'] = fact;
    data['length'] = length;
    return data;
  }
}
