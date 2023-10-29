import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/home_screen.dart';

void main() {
  runApp(const VelocityBloom());
}

class VelocityBloom extends StatelessWidget {
  const VelocityBloom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
