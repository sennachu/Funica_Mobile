import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/cart/cart_cubit.dart';
import 'package:funica_mobile/bloc/client/client_cubit.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/core/utils.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:funica_mobile/screens/user_login_screen/login.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:grock/grock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/locazilations.dart';

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
  late ClientCubit clientCubit;
  late CartCubit cartCubit;
  late ProductsCubit productsCubit;

  @override
  void initState() {
    init();
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cartCubit = context.read<CartCubit>();
    productsCubit = context.read<ProductsCubit>();
  }

  String? mail;
  String? password;

  init() async {
    await SecureStorage().readSecureData("mail");
    await SecureStorage().readSecureData("password");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mail = prefs.getString('usernameLogin');
    password = prefs.getString("passwordLogin");
    setState(() {});
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
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
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
                      Gap(213),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Row(
                    children: [
                      Gap(258),
                      Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: IconButton(
                            onPressed: () {
                              if (clientCubit.state.language == "tr") {
                                clientCubit.changeLanguage(language: "en");
                              } else {
                                clientCubit.changeLanguage(language: "tr");
                              }
                            },
                            icon: Icon(Icons.language),
                          ),
                        ),
                        
                      if(clientCubit.state.darkMode)
                      IconButton(
                          onPressed: () {
                            clientCubit.changeDarkMode(darkMode: false);
                          },
                          icon: Icon(Icons.sunny))
                      else
                      IconButton(
                          onPressed: () {
                            clientCubit.changeDarkMode(darkMode: true);
                          },
                          icon: Icon(Icons.nightlight)),
                    ],
                  ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("assets/images/kadin1.jpeg"),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: 130.onlyRightP,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.black, Colors.blue], // İstediğiniz renkleri buraya ekleyin
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
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
                        ),
                      ],
                    ),

                  Gap(10),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context).getTranslate('E-Mail: $mail'),
                          style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            AppLocalizations.of(context).getTranslate('Şifre: $password'),
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
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gap(5),
                          Text(
                             AppLocalizations.of(context).getTranslate("Profil Düzenle"),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
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
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gap(5),
                          Text(
                           AppLocalizations.of(context).getTranslate("Adres"),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
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
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gap(5),
                          Text(
                            AppLocalizations.of(context).getTranslate("Bildirimler"),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
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
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gap(5),
                          Text(
                             AppLocalizations.of(context).getTranslate("Güvenlik"),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          
                        ],
                      )),
                 
                  
                  
                  
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gap(5),
                        Text(
                          AppLocalizations.of(context).getTranslate("Politikalar"),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Gap(211),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gap(5),
                        Text(
                          AppLocalizations.of(context).getTranslate("Yardım"),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gap(5),
                        Text(
                          AppLocalizations.of(context).getTranslate("Arkadaşları Davet Et"),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Gap(215),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  GestureDetector(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
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
                          AppLocalizations.of(context).getTranslate("Oturumu Kapat"),
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
    );
  }
}
