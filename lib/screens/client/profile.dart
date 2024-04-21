import 'package:flutter/material.dart';
import 'package:funica_mobile/screens/profile_sec/adress.dart';
import 'package:funica_mobile/screens/profile_sec/help.dart';
import 'package:funica_mobile/screens/profile_sec/inv_friends.dart';
import 'package:funica_mobile/screens/profile_sec/language.dart';
import 'package:funica_mobile/screens/profile_sec/notification.dart';
import 'package:funica_mobile/screens/profile_sec/payment.dart';
import 'package:funica_mobile/screens/profile_sec/privacy.dart';
import 'package:funica_mobile/screens/profile_sec/security.dart';
import 'package:google_fonts/google_fonts.dart'; // Google Fonts'u import et

import 'package:funica_mobile/screens/client/login.dart';
import 'package:funica_mobile/screens/profile_sec/edit_profile.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:funica_mobile/widgets/profileButtons.dart';

class ProfileScreen extends StatelessWidget {
  void navigateToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      // Poppins fontunu kullan
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Eve Holt',
                  style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ProfileButton(
                buttonText: "Edit Profile",
                iconData: Icons.person_outline,
                routes: MaterialPageRoute(
                    builder: (context) => EditProfileScreen()),
              ),
              ProfileButton(
                  buttonText: "Address",
                  iconData: Icons.location_on_outlined,
                  routes:
                      MaterialPageRoute(builder: (context) => AddressScren())),
              ProfileButton(
                buttonText: "Notification",
                iconData: Icons.notifications_outlined,
                routes: MaterialPageRoute(
                    builder: (context) => NotificationScreen()),
              ),
              ProfileButton(
                buttonText: "Payment",
                iconData: Icons.wallet_outlined,
                routes:
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
              ),
              ProfileButton(
                buttonText: "Security",
                iconData: Icons.verified_user_outlined,
                routes:
                    MaterialPageRoute(builder: (context) => SecurityScreen()),
              ),
              ProfileButton(
                  buttonText: "Language",
                  iconData: Icons.language_outlined,
                  routes: MaterialPageRoute(
                      builder: (context) => LanguageScreen())),
              Center(
                child: Text(
                  "Buraya dark mode gelecek",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              ProfileButton(
                buttonText: "Privacy Policy",
                iconData: Icons.lock_outline,
                routes:
                    MaterialPageRoute(builder: (context) => PrivacyScreen()),
              ),
              ProfileButton(
                buttonText: "Help Center",
                iconData: Icons.info_outline,
                routes: MaterialPageRoute(builder: (context) => HelpScreen()),
              ),
              ProfileButton(
                buttonText: "Invite Friends",
                iconData: Icons.diversity_3_outlined,
                routes: MaterialPageRoute(
                  builder: (context) => InviteScreen(),
                ),
              ),
              Center(
                child: Text(
                  "Buraya sign out gelecek",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 4),
    );
  }
}