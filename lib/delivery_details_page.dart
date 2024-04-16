// delivery_details_page.dart

import 'package:aqualytic/YourOrdersPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryDetailsPage extends StatefulWidget {
  @override
  _DeliveryDetailsPageState createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  


  final _formKey = GlobalKey<FormState>();

  void _placeOrder() async {
  if (_formKey.currentState!.validate()) {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final userId = currentUser.uid;

        await FirebaseFirestore.instance.collection('orders').add({
          'userId': userId,
          'address': _addressController.text,
          'pincode': _pincodeController.text,
          'city': _cityController.text,
          'landmark': _landmarkController.text,
          'name': _nameController.text,
          'timestamp': DateTime.now(),
        });

        // Show confirmation message or animation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Order placed successfully!')),
        );

        // Navigate to "Your Orders" page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YourOrdersPage()),
        );
      }
    } catch (error) {
      // Handle error
      print('Error placing order: $error');
      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error placing order. Please try again later.')),
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pincode';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _landmarkController,
                decoration: InputDecoration(labelText: 'Landmark'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a landmark';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _placeOrder,
                child: Text('Order Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
