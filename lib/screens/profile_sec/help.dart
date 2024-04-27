import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  instagram() {
    final Uri uri = Uri.parse("https://www.instagram.com/deniz.ylldzz/");
    launchUrl(uri);
  }

  mail() {
    final Uri uri = Uri.parse("mailto:denizz.yldz8@gmail.com?subject=Destek Talebi&body=Merhaba uygulamayla ilgili problemim var.");
      launchUrl(uri);
  }
  linkedin() {
      final Uri uri = Uri.parse("https://www.linkedin.com/in/denizyıldızz/");
      launchUrl(uri);
  }
  call() {
      final Uri uri = Uri.parse("tel:+905383045678");
      launchUrl(uri);
  }
  whatsapp() {
    final Uri uri = Uri.parse("https://wa.me/+906473738838393?text=merhaba yardımıcı olurmusunuz?");
      launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 1, 8, 88),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            GoRouter.of(context).go('/profile');
          },
        ),
        title: Text(
          "Help",
          style: TextStyle(color: Colors.white),
        ),
      ), 

      body: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 150,
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(bottom:50),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 31, 31, 31),
              borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "You can contact us for help.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(184, 231, 231, 234)),
                ),
              ),
            ),
          ),
          
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: instagram,
                  child: Image.asset(
                    "assets/images/instagram.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: mail,
                  child: Image.asset(
                    "assets/images/love.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: linkedin,
                  child: Image.asset(
                    "assets/images/linkedin2.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: call,
                  child: Image.asset(
                    "assets/images/phone.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: whatsapp,
                  child: Image.asset(
                    "assets/images/whatsapp.png",
                    width: 70,
                  )),
            ],
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}
