import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});
  @override
  State<HomeScreen2> createState() {
    return _HomeScreen2State();
  }
}

class _HomeScreen2State extends State<HomeScreen2> {
  TextEditingController data = TextEditingController();
  String showingData = "";
  changetext(String balu) {
    setState(() {
      showingData = balu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: data,
                onChanged: (value) => changetext(value),
                decoration: const InputDecoration(
                  labelText: "Data",
                  border: OutlineInputBorder(),
                  hintText: "Enter Data...",

                  // floatingLabelBehavior: FloatingLabelBehavior.auto
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              showingData,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}

class Dataclass {
  String data = "elsner data";
}

class JsontoDart {
  String? activity;
  String? type;
  int? participants;
  int? price;
  String? link;
  String? key;
  int? accessibility;

  JsontoDart(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  JsontoDart.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    data['accessibility'] = accessibility;
    return data;
  }
}
