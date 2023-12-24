import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocitybloom/presentation/user/signup.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const VelocityBloom());
}

class VelocityBloom extends StatelessWidget {
  const VelocityBloom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
