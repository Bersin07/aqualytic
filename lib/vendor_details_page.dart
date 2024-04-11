// doctor_details_page.dart

import 'package:flutter/material.dart';

class VendorDetailsPage extends StatelessWidget {
  final String doctorImagePath;
  final String doctorName;
  final String doctorProfession;
  final String doctorRating;

  VendorDetailsPage({
    required this.doctorImagePath,
    required this.doctorName,
    required this.doctorProfession,
    required this.doctorRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              doctorImagePath,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              doctorName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              doctorProfession,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Rating: $doctorRating',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add functionality to book the doctor
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
