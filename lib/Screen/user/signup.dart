import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocitybloom/utils/app_string.dart';
import 'package:velocitybloom/utils/widget.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({key: Key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  handleGoogleSignUpButton() {
    //for showing progress bar
    //Dialogs.shawProgressBar(context);
  //
  //   _signUpWithGoogle().then((user) async {
  //     //for hiding progress bar
  //     Navigator.pop(context);
  //
  //     if (user != null) {
  //       log('\nUser: ${user.user}');
  //       log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
  //
  //       if ((await APIs.userExists())) {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  //       } else {
  //         await APIs.createUser().then((value) {
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  //         });
  //       }
  //     }
  //   });
  }

  // Future<UserCredential?> _signUpWithGoogle() async {
  //   try {
  //     await InternetAddress.lookup('google.com');
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount?  googleUser = await GoogleSignIn().signIn();
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //     await googleUser?.authentication;
  //
  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential
  //       (credential);
  //   } catch (e) {
  //     log('\n_signInWithGoogle: $e');
  //     //Dialogs.showSnakeBar(context, 'Something Went Wrong (Check Internet!)');
  //     return null;
  //   }
  // }
  @override
  Widget build(context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(206, 165, 165, 1),
      appBar: getAppBar(const Text(AppStrings.signUp), centerTitle: true,
          backgroundColor: const Color.fromRGBO(151, 5, 30, 0.965)),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mediaHeight * 0.1),
                getTextFormFiled(
                  controller: nameController,
                  labelText: const Text('Name'),
                  hintText: 'Name',
                  border: const OutlineInputBorder(),
                  onSaved: (val) => val ?? '',
                  validator: (val) =>
                      val != null && val.isNotEmpty ? null : 'Required Field',
                ),
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
                SizedBox(height: mediaHeight * 0.02),
                getTextFormFiled(
                  controller: repasswordController,
                  labelText: const Text('Re-Password'),
                  hintText: 'Re-Password',
                  border: const OutlineInputBorder(),
                  onSaved: (val) => val ?? '',
                  validator: (val) =>
                      val != null && val.isNotEmpty ? null : 'Required Field',
                ),
                SizedBox(height: mediaHeight * 0.04),
                getElevatedButtonWithIcon(
                    buttonText: AppStrings.submit,
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
                getGoogleSignInAndSignUpButton( handleGoogleSignUpButton() , ''
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
                    // ignore: prefer_const_constructors
                    Text(AppStrings.haveAccount),
                    TextButton.icon(
                        onPressed: () => _navigateToLoginScreen(),
                        icon: const Icon(Icons.person, color: Colors.brown,),
                        label: const Text(AppStrings.signIn, style: TextStyle
                          (color:
                        Colors.brown, fontWeight: FontWeight.w600, fontSize:
                        16),)),
                  ],
                )
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
    if (passwordController != repasswordController) {
      print('password not matched check your password');
      return;
    }
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then(
      (value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    ).onError((error, stackTrace) {
      print('error: ${error.toString()}');
    });
  }

  _navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
