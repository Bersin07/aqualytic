// doctor_details_page.dart

import 'package:flutter/material.dart';
import 'delivery_details_page.dart';

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
                // Navigate to the DeliveryDetailsPage to book the vendor
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryDetailsPage()),
                ).then((value) {
                  // This code block executes when the DeliveryDetailsPage pops,
                  // meaning the order was successfully placed.
                  if (value == true) {
                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order placed successfully!')),
                    );
                  }
                });
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
