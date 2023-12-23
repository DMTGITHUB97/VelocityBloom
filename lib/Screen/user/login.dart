import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocitybloom/Screen/home_screen.dart';
import 'package:velocitybloom/Screen/user/signup.dart';
import 'package:velocitybloom/utils/app_string.dart';
import 'package:velocitybloom/utils/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key: Key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  handleGoogleSignInButton() {
    //for showing progress bar
    //Dialogs.shawProgressBar(context);

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount?  googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential
    (credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      getSnakeBar(context, const Text('Something Went Wrong (Check Internet!)'));
      //Dialogs.showSnakeBar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
  }
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
                SizedBox(height: mediaHeight * 0.04, child: const Text
                  (AppStrings
                    .or),),
                getGoogleSignInAndSignUpButton( (){handleGoogleSignInButton()
                ;} , ''
                    'SignUp with '
                    'google', const TextStyle
                  (fontWeight:
                FontWeight.w500, fontSize: 18), MediaQuery.of(context).size
                    .height * 0.07,
                    MediaQuery.of(context).size.width * 0.07),
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

  _handleSubmitButtonClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  //handleGoogleSignInButton() {}
}