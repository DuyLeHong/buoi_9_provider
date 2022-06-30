import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
            ),
            SizedBox(height: 8),
            TextField(
              controller: _passwordController,
            ),
            SizedBox(height: 50),
            TextButton(
                onPressed: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    Navigator.of(context).pushReplacementNamed('/');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
