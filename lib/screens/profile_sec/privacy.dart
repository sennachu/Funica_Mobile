import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
        title: Text("Privacy"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "1. Types of Data Collect",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Bold text
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                // Lorem ipsum text
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices lobortis justo, in venenatis massa condimentum id. Aliquam in ultricies metus. Proin tincidunt, arcu non sodales pharetra, dolor velit feugiat libero, eu fringilla neque orci a sem. Nullam nec blandit dolor. Nam ultricies posuere ipsum nec interdum. Sed vehicula nunc id tellus tincidunt, eget ultricies nunc auctor. Aliquam erat volutpat. Sed nec est a lectus condimentum posuere a nec enim. Sed rhoncus augue at justo scelerisque, vel fermentum metus finibus. Duis lobortis nisi ut dolor vestibulum, id consequat libero imperdiet.",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "2. Use of Your Personel Data",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Bold text
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                // Lorem ipsum text
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices lobortis justo, in venenatis massa condimentum id. Aliquam in ultricies metus. Proin tincidunt, arcu non sodales pharetra, dolor velit feugiat libero, eu fringilla neque orci a sem. Nullam nec blandit dolor. Nam ultricies posuere ipsum nec interdum. Sed vehicula nunc id tellus tincidunt, eget ultricies nunc auctor. Aliquam erat volutpat. Sed nec est a lectus condimentum posuere a nec enim. Sed rhoncus augue at justo scelerisque, vel fermentum metus finibus. Duis lobortis nisi ut dolor vestibulum, id consequat libero imperdiet.",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "3. Disclosure of Your Personel Data",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, // Bold text
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                // Lorem ipsum text
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices lobortis justo, in venenatis massa condimentum id. Aliquam in ultricies metus. Proin tincidunt, arcu non sodales pharetra, dolor velit feugiat libero, eu fringilla neque orci a sem. Nullam nec blandit dolor. Nam ultricies posuere ipsum nec interdum. Sed vehicula nunc id tellus tincidunt, eget ultricies nunc auctor. Aliquam erat volutpat. Sed nec est a lectus condimentum posuere a nec enim. Sed rhoncus augue at justo scelerisque, vel fermentum metus finibus. Duis lobortis nisi ut dolor vestibulum, id consequat libero imperdiet.",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
          BottomNavigator(selectedIndex: 4),
        ],
      ),
    );
  }
}
