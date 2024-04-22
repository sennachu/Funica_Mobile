import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:funica_mobile/screens/client/login.dart';

import 'package:funica_mobile/widgets/bottomNavigation.dart';


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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
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
                  Gap(5),
                  Padding(
                    padding: const EdgeInsets.only(top:45),
                    child: Row(
                      children: [
                        Text(
                          'Profile',
                          style: GoogleFonts.poppins(
                            // Poppins fontunu kullan
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(210),
                        Icon(Icons.pending_outlined)
                      ],
                    ),
                  ),
                ],
              ),
              Gap(30),
             Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/kadin1.jpeg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 135,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: Icon(Icons.edit,color: Colors.white ,size: 16,),
                        onPressed: () {
                          // Kalem simgesine tıklandığında yapılacak işlemler buraya yazılabilir
                        },
                      ),
                    ),
                    ),
                ],
              ),
              Gap(10),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Eve Holt',
                      style: GoogleFonts.comfortaa(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+1 467 789 469',
                      style: GoogleFonts.comfortaa(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
                Container(
                  height: 1,
                  color: const Color.fromARGB(255, 216, 216, 216), // İsteğe bağlı, çizginin rengini değiştirebilirsiniz
                ),
              SizedBox(height: 20),
              GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/edit');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.person_outline,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Edit Profile",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(230),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/address');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Adress",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(261),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/notification');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.notifications_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Notification",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(228),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/payment');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.wallet_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Payment",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(251),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/security');
                  },
                  child: Row(
                    children: [
                      Icon( Icons.verified_user_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Security",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(254),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/language');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.language_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Language",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(243),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  )
                  ),
                  Gap(20),
                  Center(
                    child: Text(
                      "Buraya dark mode gelecek",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                ),
                Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/privacy');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.lock_outline,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Privacy Policy",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(213),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  ),
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/help');
                  },
                  child: Row(
                    children: [
                      Icon( Icons.info_outline,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Help",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(282),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  ),
                  ),
                  Gap(20),
                  GestureDetector(
                        onTap: () {
                    GoRouter.of(context).go('/invite');
                  },
                  child: Row(
                    children: [
                      Icon( Icons.diversity_3_outlined,size: 20,color: Colors.black,),
                      Gap(5),
                      Text("Invite Friends",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Gap(217),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15, 
                      ),
                    ],
                  ),
                  ),
                  Gap(20),
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