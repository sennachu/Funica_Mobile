import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/client/client_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:funica_mobile/screens/user_login_screen/login.dart';

import 'package:funica_mobile/widgets/bottomNavigation.dart';

void showFriendInvitedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Friend Invited!"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ClientCubit  clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit =  context.read<ClientCubit>();

  }

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
                    padding: const EdgeInsets.only(top: 45),
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
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
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
                color: const Color.fromARGB(255, 216, 216,
                    216), // İsteğe bağlı, çizginin rengini değiştirebilirsiniz
              ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/edit');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Edit Profile",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      Gap(230),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  )),
              Gap(20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/address');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Adress",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      Gap(261),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  )),
              Gap(20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/notification');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Notification",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      Gap(228),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  )),
              Gap(20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/payment');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.wallet_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Payment",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      Gap(251),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  )),
              Gap(20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/security');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Security",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      Gap(254),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  )),
              Gap(20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/language');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.language_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      Gap(5),
                      Text(
                        "Language: " + clientCubit.state.language,
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                      
                      
                    ],
                  )),
              Gap(20),
              Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                  Gap(5),
                  Text(
                    "Themes" + clientCubit.state.darkMode.toString(),
                     style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),),
                  Gap(90),
                  ElevatedButton(
                      onPressed: () {
                        clientCubit.changeDarkMode(darkMode: true);
                      },
                      child: Text("DA")),
                      Gap(5),
                      ElevatedButton(
                      onPressed: () {
                        clientCubit.changeDarkMode(darkMode: false);
                      },
                      child: Text("GÜ")),

                ],
              ),
              Gap(20),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/privacy');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: Colors.black,
                    ),
                    Gap(5),
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
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
                    Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Colors.black,
                    ),
                    Gap(5),
                    Text(
                      "Help",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
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
                  showFriendInvitedDialog(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.diversity_3_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    Gap(5),
                    Text(
                      "Invite Friends",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
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
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/boarding');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      size: 20,
                      color: Colors.red,
                    ),
                    Gap(5),
                    Text(
                      "Sign Out",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.red),
                    ),
                  ],
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
