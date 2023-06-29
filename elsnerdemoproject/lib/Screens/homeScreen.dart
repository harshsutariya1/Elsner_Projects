//First page after login...
// Gallery

// import 'package:elsnerdemoproject/firstPage.dart';
import 'package:elsnerdemoproject/Functionality/loginFunctionality.dart';
import 'package:elsnerdemoproject/Screens/homeScreen2.dart';
import 'package:elsnerdemoproject/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    final size = MediaQuery.of(context).size;
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
                  Fluttertoast.showToast(msg: "Loged Out Successfully");
                },
                icon: const Icon(Icons.logout))
          ],
        ),
// ________________________________________________________________________________________
// ________________________________________________________________________________________
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ApiExample()));
                  },
                  icon: const Icon(Icons.api_rounded),
                  label: const Text("API Example"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              // scrollDirection: ,
              child: Row(
                children: [rowCards()],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Images",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ImageShowScreen(images[index])));
                          },
                          child: SizedBox(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Opacity(
                                opacity: 0.3,
                                child: Image.asset(
                                  "assets/${images[index]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${images[index]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________
class ImageShowScreen extends StatelessWidget {
  const ImageShowScreen(
    this.image, {
    super.key,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    print("imageshow widget ");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 244, 67, 54),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset("assets/$image"),
        ),
      ),
    );
  }
}
// ________________________________________________________________________________________
// ________________________________________________________________________________________
// ________________________________________________________________________________________

Widget rowCards() {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    height: 300,
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(),
    ),
    child: Column(children: [
      Image.asset(
        "assets/car.jpg",
        height: 150,
        width: 250,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 5,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Car Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              "4.0 (150)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: 60, width: double.maxFinite,
        // decoration: BoxDecoration(border: Border.all()),
        child: const Text(
            "Excepteur Fugiat officia exercitation consequat ex laboris ipsum proident velit sit est minim."),
      ),
      const Divider(
        thickness: 3,
        indent: 8,
        endIndent: 8,
      ),
      Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: 30,width: 30,
              child: Image.asset("assets/lock1.png",),
              ),
              
          ),
          const SizedBox(width: 3,),
          const Text("Car Services"),
          const SizedBox(width: 35,),
          const Text("From: "),
          Container(
            padding: const EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 170, 75, 68),
              borderRadius: BorderRadius.circular(5)
            ),
            child: const Text("\$100",style: TextStyle(color: Colors.white),),
          )
        ],
      )
    ]),
  );
}
