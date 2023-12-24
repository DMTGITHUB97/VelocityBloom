import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/home_screen.dart';
import 'package:velocitybloom/Screen/user/signup.dart';
import 'package:velocitybloom/utils/app_string.dart';
import 'package:velocitybloom/utils/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(206, 165, 165, 1),
      appBar: getAppBar(const Text(AppStrings.signIn), centerTitle: true,
        backgroundColor: const Color.fromRGBO(151, 5, 30, 0.965),),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mediaHeight * 0.1),
                SizedBox(height: mediaHeight * 0.02),
                getTextFormFiled(
                  controller: emailController,
                  labelText: const Text('Email'),
                  hintText: 'Email',
                  border: const OutlineInputBorder(),
                  onSaved: (val) => val ?? '',
                  validator: (val) =>
                      val != null && val.isNotEmpty ? null : 'Required Field',
                ),
                SizedBox(height: mediaHeight * 0.02),
                getTextFormFiled(
                  controller: passwordController,
                  labelText: const Text('Password'),
                  hintText: 'Password',
                  border: const OutlineInputBorder(),
                  obscureText: true,
                  onSaved: (val) => val ?? '',
                  validator: (val) =>
                      val != null && val.isNotEmpty ? null : 'Required Field',
                ),
                SizedBox(height: mediaHeight * 0.04),
                getElevatedButtonWithIcon(
                    buttonText: 'Submit',
                    icon: Icons.person,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 18),
                    buttonStyle: ButtonStyle(shape: MaterialStateProperty.all
                      (RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        backgroundColor: MaterialStateProperty.all(Colors.brown),
                        foregroundColor: MaterialStateProperty.all(Colors.white)),
                    onPressed: () => _handleSubmitButtonClick()),
                SizedBox(height: mediaHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have Account?"),
                    TextButton.icon(
                        onPressed: () => _navigateToSignUp(),
                        icon: const Icon(Icons.person, color: Colors.brown,),
                        label: const Text(AppStrings.signUp, style: TextStyle
                          (color:
                        Colors.brown, fontWeight: FontWeight.w600, fontSize:
                        16),),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleSubmitButtonClick() async{
    if (_formKey.currentState!.validate()) {
      //_formKey.currentState!.save();

      print([FirebaseAuth.instance.currentUser?.uid, FirebaseAuth.instance
          .currentUser?.providerData
      ]);
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (context) => const HomeScreen()));
      }
    }
  }

  _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }
}
