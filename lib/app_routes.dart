// app_routes.dart

import 'package:flutter/material.dart';
import 'package:aqualytic/payment_page.dart'; // Import the payment page

// Define the route for the payment page
MaterialPageRoute paymentPageRoute() {
  return MaterialPageRoute(builder: (context) => PaymentPage());
}
