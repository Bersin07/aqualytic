import 'package:aqualytic/VendorCard.dart';
import 'package:flutter/material.dart';
import 'vendor_details_page.dart'; // Import your VendorDetailsPage

class VendorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor List'),
      ),
      body: Container(
        color: Colors.grey[100], // Set background color to greywhite
        child: GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Set the number of columns in the grid
            crossAxisSpacing: 16.0, // Set the spacing between columns
            mainAxisSpacing: 16.0, // Set the spacing between rows
          ),
          itemCount: 10, // Set the number of vendors
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the VendorDetailsPage when a vendor is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VendorDetailsPage(
                      doctorImagePath: 'lib/images/vendor${index + 1}.png',
                      doctorName: 'Vendor ${index + 1}',
                      doctorProfession: 'Specialization',
                      doctorRating: '4.${index + 5}',
                    ),
                  ),
                );
              },
              child: VendorCard(
                vendorImagePath: 'lib/images/vendor${index + 1}.png', // Assuming vendor images are named vendor1.png, vendor2.png, etc.
                vendorName: 'Vendor ${index + 1}',
                vendorSpecialization: 'Specialization',
                vendorRating: '4.${index + 5}',
              ),
            );
          },
        ),
      ),
    );
  }
}
