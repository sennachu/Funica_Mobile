import 'package:flutter/material.dart';
import '../../widgets/bottomNavigation.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              child: Center(child: Text("profile")),
            ),
            
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              
            ),
           BottomNavigator(selectedIndex: 4),
        ],
      ),
    );
  }
}