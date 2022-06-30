import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPersistentFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3), () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            print('User is currently signed out!');
            Navigator.of(context).pushReplacementNamed('/register');
          } else {
            print('User is signed in!');
            Navigator.of(context).pushReplacementNamed('/');
          }
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SPLASH'),
      ),
    );
  }
}
