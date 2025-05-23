import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static const String screenRoute = 'SigninScreen';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 50),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                SizedBox(height: 8),
                CustomTextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your Password",
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                CustomButton(
                  text: 'Sign in',
                  color: Colors.yellow[900]!,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final user = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                        setState(() {
                          showSpinner = false;
                        });
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
