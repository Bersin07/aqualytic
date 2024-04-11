import 'package:aqualytic/components/category_card.dart';
import 'package:aqualytic/components/doctor_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'vendor_list_page.dart';
import 'vendor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

//sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // Function to navigate to DoctorDetailsPage
  void _navigateToDoctorDetailsPage(
    String doctorImagePath,
    String doctorName,
    String doctorProfession,
    String doctorRating,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VendorDetailsPage(
          doctorImagePath: doctorImagePath,
          doctorName: doctorName,
          doctorProfession: doctorProfession,
          doctorRating: doctorRating,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hello,',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bersin B',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  //profile pic
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //card how do you feel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    //animation or pic
                    Container(
                        height: 100,
                        width: 100,
                        child: Lottie.network(
                            'https://lottie.host/01b97b8d-4faf-4a60-ae04-2b2b64fd3196/LNCwOLicfv.json')),

                    SizedBox(
                      width: 20,
                    ),

                    // how do you feel and get start button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How do you feel?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Book water spots on the go! Stay refreshed effortlessly',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Get started',
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 183, 217, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you',
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //horizontal list view -> categories surgeon
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryCard(
                    categoryName: 'Water',
                    iconImagePath: 'lib/icons/drop.png',
                  ),
                  categoryCard(
                    categoryName: 'Lorry-Water',
                    iconImagePath: 'lib/icons/truck.png',
                  ),
                  categoryCard(
                    categoryName: 'Water-Quality',
                    iconImagePath: 'lib/icons/quality.png',
                  ),
                  categoryCard(
                    categoryName: 'Waste-water',
                    iconImagePath: 'lib/icons/waste-water.png',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // doctor list
            // Doctor list section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vendor list',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VendorListPage()),
                      );
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 16), // Add padding at the beginning
                  GestureDetector(
                    onTap: () {
                      _navigateToDoctorDetailsPage(
                        'lib/images/doctor1.jpg',
                        'Doctor 1',
                        'Specialization',
                        '4.5',
                      );
                    },
                    child: doctorCard(
                      doctorImagePath: 'lib/images/doctor1.jpg',
                      doctorName: 'Doctor 1',
                      doctorProfession: 'Specialization',
                      doctorRating: '4.5',
                    ),
                  ),
                  SizedBox(width: 16), // Add padding between doctor cards
                  GestureDetector(
                    onTap: () {
                      _navigateToDoctorDetailsPage(
                        'lib/images/doctor2.jpg',
                        'Doctor 2',
                        'Specialization',
                        '4.7',
                      );
                    },
                    child: doctorCard(
                      doctorImagePath: 'lib/images/doctor2.jpg',
                      doctorName: 'Doctor 2',
                      doctorProfession: 'Specialization',
                      doctorRating: '4.7',
                    ),
                  ),
                  SizedBox(width: 16), // Add padding between doctor cards
                  GestureDetector(
                    onTap: () {
                      _navigateToDoctorDetailsPage(
                        'lib/images/doctor3.jpg',
                        'Doctor 3',
                        'Specialization',
                        '4.8',
                      );
                    },
                    child: doctorCard(
                      doctorImagePath: 'lib/images/doctor3.jpg',
                      doctorName: 'Doctor 3',
                      doctorProfession: 'Specialization',
                      doctorRating: '4.8',
                    ),
                  ),
                  SizedBox(width: 16), // Add padding at the end
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
