import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
        title: Text("Security"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          ListTile(
            title: Text(
              "Remember Me",
              style: GoogleFonts.poppins(),
            ),
            trailing: Switch(
              value: true,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  // Handle switch state changes here
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              "Face ID",
              style: GoogleFonts.poppins(),
            ),
            trailing: Switch(
              value: false,
              onChanged: (value) {
                setState(() {
                  // Handle switch state changes here
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              "Biometric ID",
              style: GoogleFonts.poppins(),
            ),
            trailing: Switch(
              value: true,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  // Handle switch state changes here
                });
              },
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Google Authenticator",
                  style: GoogleFonts.poppins(),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          SizedBox(height: 20), // Add spacing between list items and buttons
          ElevatedButton(
            onPressed: () {
              // Handle Change PIN button press
            },
            child: Text('Change PIN'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          SizedBox(height: 10), // Add spacing between buttons
          ElevatedButton(
            onPressed: () {
              // Handle Change Password button press
            },
            child: Text('Change Password'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 4),
    );
  }
}
