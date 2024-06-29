import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resep_app/views/home.dart';
import 'package:flutter_resep_app/views/widget/landing.dart';
import 'package:flutter_resep_app/views/widget/tentang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.pinkAccent,
        // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<CurvedNavigationBarState> _NavKey = GlobalKey();

  var PagesAll = [Landing(), HomePage(), Tentang()];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant),
              SizedBox(width: 10),
              Text(
                "RECIPES",
                style: TextStyle(fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _NavKey,
          items: [
            Icon(Icons.brunch_dining_sharp),
            Icon(Icons.food_bank),
            Icon(Icons.supervised_user_circle_rounded)
          ],
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          animationCurve: Curves.fastLinearToSlowEaseIn,
          color: Colors.pinkAccent,
        ),
        body: PagesAll[myindex]);
  }
}
