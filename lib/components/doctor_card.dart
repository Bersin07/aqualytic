import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class doctorCard extends StatelessWidget {

  final String doctorName;
  final String doctorProfession;
  final String doctorImagePath;
  final String doctorRating;

  const doctorCard({super.key, required this.doctorName, required this.doctorProfession, required this.doctorImagePath, required this.doctorRating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            //picture
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                doctorImagePath,
                height: 100,
              ),
            ),
            SizedBox(height: 10,),

            //rate out
            Row(
              children: [Icon(Icons.star), Text(
                doctorRating,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                )],
            ),

            SizedBox(height: 10,),
            // doctor name

            Text(
              doctorName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),

            //doctor title
            Text(doctorProfession)
          ],
        ),
      ),
    );
  }
}
