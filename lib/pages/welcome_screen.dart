// Flutter Package
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Dart Files
import './login_screen.dart';
import './registration_screen.dart';
import '../widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String route = "/welcome-screen";

  const WelcomeScreen({Key key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: TextLiquidFill(
                    text: 'Flash Chat',
                    waveDuration: const Duration(seconds: 5),
                    waveColor: Colors.red,
                    boxBackgroundColor: Colors.white,
                    boxHeight: 80,
                    textStyle: const TextStyle(
                        fontSize: 45.0, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Sign In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
