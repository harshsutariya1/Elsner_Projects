// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  List<dynamic> users = [];
  void fetchData() async {
    print("geting api...");
    const url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print("api captured...");
    final body = response.body;
    final json = jsonDecode(body);
    print("json data captured...");
    setState(() {
      users = json["results"];
      print("users data added...");
    });
    print("fetchData successfully");
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // final screen_size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.red,
          title: const Text("Users Api Example"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            final email = user["email"];
            final name =
                "${user["name"]["title"]} ${user["name"]["first"]} ${user["name"]["last"]}";
            final imageurl = "${user["picture"]["large"]}";
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDetails(
                                name: name,
                                email: email,
                                imageurl: imageurl,
                                city: user["location"]["city"],
                                state: user["location"]["state"],
                                country: user["location"]["country"],
                                age: (user["dob"]["age"]).toString(),
                                gender: user["gender"],
                                phoneNumber: user["phone"],
                              )));
                },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageurl),
                  ),
                  title: Text(name),
                  subtitle: Text(email),
                ));
          },
        ),
      ),
    );
  }
}

class ShowDetails extends StatelessWidget {
  const ShowDetails({
    super.key,
    required this.name,
    required this.email,
    required this.city,
    required this.country,
    required this.age,
    required this.gender,
    required this.imageurl,
    required this.phoneNumber,
    required this.state,
  });
  final String name,
      email,
      imageurl,
      phoneNumber,
      city,
      state,
      country,
      age,
      gender;

  Widget detailsRow({required String title, required String description}) {
    return SizedBox(
      height: 50,
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(size: 30, color: Colors.red),
              foregroundColor: Colors.red,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(imageurl),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  detailsRow(title: "Full Name:", description: name),
                  detailsRow(title: "Email Address:", description: email),
                  detailsRow(title: "Gender:", description: gender),
                  detailsRow(title: "Phone Number:", description: phoneNumber),
                  detailsRow(title: "Age:", description: age),
                  detailsRow(title: "City:", description: city),
                  detailsRow(title: "State:", description: state),
                  detailsRow(title: "Country:", description: country),
                ],
              ),
            )));
  }
}
