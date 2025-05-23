import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/screens/signin_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String screenRoute = 'WelcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  "MessageMe",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton(
              color: Colors.yellow[900]!,
              text: "Sign in",
              onPressed: () {
                Navigator.pushNamed(context, SigninScreen.screenRoute);
              },
            ),
            CustomButton(
              color: Colors.blue[800]!,
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
