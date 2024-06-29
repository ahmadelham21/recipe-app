import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Text(
                "Welcome To Application Recipes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 20),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/id/3/35/Emblem_of_Universitas_Muhammadiyah_Kalimantan_Timur.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Universitas Muhammadiyah kalimantan timur",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.pinkAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
