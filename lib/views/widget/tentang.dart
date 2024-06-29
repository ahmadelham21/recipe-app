import 'package:flutter/material.dart';
import 'package:flutter_resep_app/constant/text_style.dart';
import 'package:flutter_resep_app/views/widget/profile.dart';

class Tentang extends StatelessWidget {
  const Tentang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Aplikasi Resep Video adalah aplikasi mobile inovatif yang menghadirkan koleksi resep masakan dalam bentuk video. Aplikasi ini dirancang untuk membantu pengguna dalam mempelajari cara memasak berbagai hidangan dengan mudah dan menyenangkan.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.pinkAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Kelompok 20 :",
                  style: mainStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Profile(
                  name: "Muhammad Ishak",
                  nim: "2211102441033",
                ),
                const Profile(
                  name: "Natasya Aurelia",
                  nim: "2211102441048",
                ),
                const Profile(
                  name: "Ocha Nurhaliza",
                  nim: "2211102441200",
                ),
                const Profile(
                  name: "Nur Anissa Idri",
                  nim: "2211102441188",
                ),
              ]),
        )),
      ),
    );
  }
}
