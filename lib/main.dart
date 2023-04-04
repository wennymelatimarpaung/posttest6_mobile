import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest6_080_wenny/controller.dart';
import 'splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(const TextTheme(
          displayLarge: TextStyle(color: Colors.yellow, fontFamily: 'Roboto'),
          displayMedium: TextStyle(color: Colors.yellow),
          displaySmall: TextStyle(color: Colors.yellow)
        ))
      ),
      home: SplashScreen(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(131, 188, 35, 35),
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 5),
                  child: Image.asset(
                    "assets/Logo.png",
                    alignment: Alignment.topLeft,
                    height: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Text(
                    "Wenny Melati Marpaung",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Text(
            "Big Mac, a Legend.",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Mouthwatering perfection start with two sear-sizzled\n100% pure beef patties and Big Mac sauce, sandwiched\nbetween a sesame seed bun. American cheese, crisp\nlettuce, onions and pickles top it off.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 30, top: 50, bottom: 70),
            child: Image.asset(
              "assets/LandingPage.png",
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100, right: 100),
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Daftar(),
                  ),
                );
              },
              child: Text(
                "Daftar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 100, right: 100),
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MainPage(),
                  ),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 195, 36, 36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Daftar extends StatefulWidget {
  const Daftar({Key? key}) : super(key: key);

  @override
  State<Daftar> createState() => DaftarState();
}

class DaftarState extends State<Daftar> {
  final switchController n = Get.put(switchController());
  String Name = "", ContactNumber = "", Email = "";

  TextEditingController NameController = TextEditingController();
  TextEditingController ContactNumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  Future<dynamic> CustomAlert(BuildContext context, String pesan) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Berhasil terdaftar!!",
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            content: Image.asset(
              'assets/done.png',
              height: 200,
              width: 300,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    NameController.dispose();
    ContactNumberController.dispose();
    EmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Obx(() => Container(
            color: n.switchValue.value
                ? Color.fromARGB(255, 195, 36, 36)
                : Colors.amber)),
        actions: [
          Obx(() => Switch(
                value: n.switchValue.value,
                onChanged: (newValue) {
                  n.switchValue(newValue);
                },
              )),
        ],
        backgroundColor: Colors.amber,
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              "ABOUT YOU",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: NameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name: "),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ContactNumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digits Only",
                  labelText: "Contact Number: "),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: EmailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "name@mail.com",
                  labelText: "Email: "),
            ),
            SizedBox(height: 20),
            Text(
              "Name                      : $Name",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Contact Number   : $ContactNumber",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Email                       : $Email",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 80),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  CustomAlert(context, "AlertDialog");
                  setState(() {
                    Name = NameController.text;
                    ContactNumber = ContactNumberController.text;
                    Email = EmailController.text;
                  });
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainPage(),
                    ),
                  );
                },
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 195, 36, 36),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final switchController n = Get.put(switchController());
  int _index = 0;

  static final List<Widget> _pages = [
    // Promotion
    Container(
      child: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "PaMer 5 Ayam Lengkuas\nA La Carte + Iced Coffee",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "2 PaNas1 Ayam Lengkuas\n+ 2 Tehbotol Sosro Kotak + 2\nMcFlurry feat. Oreo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Promo1.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Promo2.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Lengkuas Sambal Bajak",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "        Share Box",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Promo3.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Promo4.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Mix Berries McFlurry with\nOreo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Mix Berries McFlurry with\nFroot Loops",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Promo5.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Promo6.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "White Chocolate\nStrawberry Pastry Pie",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "            Paket Hantaran McD",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Promo7.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Promo8.png",
                  height: 137,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    // Sides
    Container(
      child: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "White Chocolate\nStrawberry Pastry Pie",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "               Apple Pie",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Sides1.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Sides2.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Share Box",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "                                      Honey Garlic Fish Rice",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Sides3.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Sides4.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Honey Garlic chicken Rice",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "             Rica Rica Fish Rice",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Sides5.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Sides6.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Rica Rica Chicken Rice",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "              Beef Burger",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Sides7.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Sides8.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Chicken Burger",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "                       Fish Snack Wrap",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Sides9.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Sides10.png",
                  height: 137,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    // Dessert
    Container(
      child: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Mix Berries McFlurry with\nOreo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    "Mix Berries McFlurry with\nFroot Loops",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Desserts1.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Desserts2.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "McFlurry featuring Oreo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "                Choco McFlurry",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Desserts3.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Desserts4.png",
                  height: 137,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Chocolate Sundae",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "                       Strawberry Sundae",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/Desserts5.png",
                  height: 136,
                ),
                Image.asset(
                  "assets/Desserts6.png",
                  height: 137,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Obx(() => Container(
            color: n.switchValue.value
                ? Color.fromARGB(255, 195, 36, 36)
                : Colors.amber)),
        actions: [
          Obx(() => Switch(
                value: n.switchValue.value,
                onChanged: (newValue) {
                  n.switchValue(newValue);
                },
              )),
        ],
        backgroundColor: Colors.amber,
        title: Text("Wenny's"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Promotion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kebab_dining),
            label: "Sides",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.icecream),
            label: "Desserts",
          ),
        ],
      ),
      body: _pages.elementAt(_index),
    );
  }
}
