import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  final iconImagePath;
  final String categoryName;
  categoryCard({super.key, required this.categoryName, this.iconImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent,
        ),
        
        child: Row(
          children: [
            Image.asset(
              iconImagePath,
              height: 30,
            ),
            SizedBox(width: 10,),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
