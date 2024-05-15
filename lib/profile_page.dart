import 'package:flutter/material.dart';
import 'package:aqualytic/home_page.dart'; // Import the HomePage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // Modify the onPressed callback to navigate to HomePage
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the HomePage
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false, // Remove all routes from the stack
            );
          },
        ),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
