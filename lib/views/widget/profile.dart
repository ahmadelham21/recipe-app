import 'package:flutter/material.dart';
import 'package:flutter_resep_app/constant/text_style.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.name, required this.nim});
  final String name;
  final String nim;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "$name - $nim",
              style: mainStyle,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    );
  }
}
