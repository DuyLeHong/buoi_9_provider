import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  AddUserPage();

  final _fullNameController = TextEditingController();
  final _companyController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users.add({
        'full_name': _fullNameController.text, // John Doe
        'company': _companyController.text, // Stokes and Sons
        'age': int.parse(_ageController.text) // 42
      }).then((value) {
        Navigator.of(context).pop();
      }).catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
            ),
            TextField(
              controller: _companyController,
            ),
            TextField(
              controller: _ageController,
            ),
            TextButton(
              onPressed: addUser,
              child: Text(
                "Add User",
              ),
            )
          ],
        ),
      ),
    );
  }
}
