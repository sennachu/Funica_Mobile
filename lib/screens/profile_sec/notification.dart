import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          "Notification",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Expanded(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "General Notification",
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
                "Sound",
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
                "Vibrate",
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
                "Special Offers",
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
                "Promo & Discount",
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
                "Payments",
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
                "Cashback",
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
                "App Updates",
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
                "New Service Available",
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
                "New Tips Available",
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 4),
    );
  }
}
