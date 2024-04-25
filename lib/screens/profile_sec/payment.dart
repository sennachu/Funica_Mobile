import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/profile');
          },
        ),
        title: Text(
          "Payment",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildPaymentBox('assets/images/paypal.png', "PayPal", "Connected"),
            SizedBox(height: 35), // Add spacing between payment boxes
            _buildPaymentBox(
                'assets/images/google.png', "Google Pay", "Connected"),
            SizedBox(height: 35),
            _buildPaymentBox(
                'assets/images/apple.png', "Apple Pay", "Connected"),
            SizedBox(height: 35),
            _buildPaymentBox(
                'assets/images/mscard.webp', "***  ***  4545", "Connected"),
            SizedBox(height: 150), // Add spacing between boxes and button
            _buildAddCardButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 4),
    );
  }

  Widget _buildPaymentBox(String imagePath, String text, String connectedText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20), // Add horizontal margin
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(imagePath, width: 40, height: 40), // Asset Image
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Expanded(
            child: Container(), // Spacer to push connected text to the right
          ),
          Text(
            connectedText,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10), // Add spacing between text and box edge
        ],
      ),
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        color: Colors.black, // Black background
        borderRadius: BorderRadius.circular(22), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle form submission
        },
        child: Text('Add New Card'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          foregroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          textStyle: GoogleFonts.poppins(color: Colors.black),
          // Customize the button color here
        ),
      ),
    );
  }
}
