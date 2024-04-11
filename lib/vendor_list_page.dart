// doctor_list_page.dart

import 'package:flutter/material.dart';
import 'package:aqualytic/components/doctor_card.dart'; // Import your DoctorCard widget here

class VendorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView(
          children: [
            SizedBox(height: 16), // Add initial spacing
            doctorCard(
              doctorImagePath: 'lib/images/doctor1.jpg',
              doctorName: 'Doctor 1',
              doctorProfession: 'Specialization',
              doctorRating: '4.5',
            ),
            SizedBox(height: 16), // Add spacing between doctor cards
            doctorCard(
              doctorImagePath: 'lib/images/doctor2.jpg',
              doctorName: 'Doctor 2',
              doctorProfession: 'Specialization',
              doctorRating: '4.7',
            ),
            SizedBox(height: 16), // Add spacing between doctor cards
            doctorCard(
              doctorImagePath: 'lib/images/doctor3.jpg',
              doctorName: 'Doctor 3',
              doctorProfession: 'Specialization',
              doctorRating: '4.8',
            ),
            SizedBox(height: 16), // Add spacing between doctor cards
            // Add more DoctorCard widgets for other doctors
          ],
        ),
      ),
    );
  }
}
