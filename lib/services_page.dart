// services_page.dart

import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  final String categoryName;

  ServicesPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Services for $categoryName'),
      ),
    );
  }
}
