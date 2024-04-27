import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:preload_page_view/preload_page_view.dart';

import '../../core/storage.dart';



class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreloadPageView(
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        children: [
          Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  "assets/images/giris1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 135.0, right: 60.0),
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Color.fromARGB(172, 255, 255, 255),
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                left: 0,
                right: 155,
                child: Center(
                  child: Text(
                    "Funica",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                right: 0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "The best furniture e-commerce app of the century for your daily needs!",
                      style: TextStyle(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              
              
              // Bottom Navigator Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        page == 0
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Colors.white,
                      ),
                      Icon(
                        page == 1
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Colors.white,
                      ),
                      Icon(
                        page == 2
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Colors.white,
                      ),
                      Icon(
                        page == 3
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              BoardingItem(
                image: "assets/images/giris2.png",
                title: "We provide high quality products just for you",
              ),
              
              
              // Bottom Navigator Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        page == 0
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 1
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 2
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 3
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              BoardingItem(
                image: "assets/images/giris3.png",
                title: "Your satisfaction is our number one priority",
              ),
             
              // Bottom Navigator Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        page == 0
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 1
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 2
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                      Icon(
                        page == 3
                            ? CupertinoIcons.circle_filled
                            : CupertinoIcons.circle,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
  children: [
    BoardingItem(
      image: "assets/images/giris4.png",
      title: "Let's fulfill your house needs with Funica right now!",
    ),
    Positioned(
      bottom: 60,
      left: 60,
      child: InkWell(
        onTap: () async {
          final storage = Storage();
          await storage.firstLaunched();
          GoRouter.of(context).replace("/letin");
        },
        child: Container(
          width: 280,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),

  ],
),
        ],
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  final String image;
  final String title;
  const BoardingItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Image.asset(image),
          Gap(30),
          Padding(
            padding: const EdgeInsets.all(85.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
