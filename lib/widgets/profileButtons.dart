import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:funica_mobile/screens/profile_sec/edit_profile.dart';

class ProfileButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData; // Icon data variable
  final MaterialPageRoute routes;

  const ProfileButton({
    Key? key,
    required this.buttonText,
    required this.iconData,
    required this.routes, // Use this.routes instead of routes directly
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          this.routes, // Use this.routes instead of routes directly
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding:
            EdgeInsets.symmetric(vertical: 10), // Increase padding slightly
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.black,
                  size: 20, // Increase icon size slightly
                ),
                SizedBox(width: 12), // Add space between icon and text
                Text(
                  buttonText,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15, // Increase font size slightly
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20, // Increase arrow icon size slightly
            ),
          ],
        ),
      ),
    );
  }
}
