import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseAuth _ath = FirebaseAuth.instance;
  var id = '';
  var email = '';

  @override
  void initState() {
    WidgetsBinding.instance?.addPersistentFrameCallback((timeStamp) {
      final user = _ath.currentUser;
      setState(() {
        email = user?.email ?? '';
        id = user?.uid ?? '';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            Text('User Id: $id'),
            Text('Email: $email'),
            SizedBox(height: 50),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/login');
                  });
                },
                child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}
