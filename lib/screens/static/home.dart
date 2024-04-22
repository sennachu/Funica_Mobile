import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Good Morning',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.waving_hand,
                  size: 20,
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Kullanıcı Adı',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_on_outlined, size: 20.0),
            onPressed: () {
              // Bildirimler sayfasına yönlendirme
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border_outlined, size: 20.0),
            onPressed: () {
              // Favoriler sayfasına yönlendirme
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 52,
                child: TextField(
                  style: TextStyle(color: Colors.black45),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 244, 243, 243),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black26),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black26,
                    suffixIcon: Icon(
                      Icons.tune,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special Offers',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            Gap(10),
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 155,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((url) {
                      int index = images.indexOf(url);
                      return Container(
                        width: 3.0,
                        height: 3.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/sofa');
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  Color.fromARGB(255, 244, 243, 243),
                              child: Icon(
                                Icons.chair_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Gap(3),
                            Text(
                              "Sofa",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ],
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/chair');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.chair_alt,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Chair",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/table');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.table_bar_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Table",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/kitchen');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.kitchen_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Kitchen",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/lamp');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.light,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Lamp",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/cupboard');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.shelves,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Cupboard",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/vase');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.local_florist_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Vase",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/others');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 243, 243),
                                child: Icon(
                                  Icons.pending_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                "Others",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            Gap(10),
            productsContainer(context),
            Gap(15),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeProductsDetails(photo: "assets/images/chair2.png",name: "Padded Chair",icon: Icon(Icons.star_half),puan: "4.5", tire: "|", sold: "8.456 sold",price: "\$120",),
                homeProductsDetails(photo: "assets/images/cup1.png",name: "Small Bookcase",icon: Icon(Icons.star_half),puan: "4.7", tire: "|", sold: "6.238 sold",price: "\$145",),
              ],
            ),
            Gap(15),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeProductsDetails(photo: "assets/images/lamp1.png",name: "Glass Lamp",icon: Icon(Icons.star_half),puan: "4.3", tire: "|", sold: "5.156 sold",price: "\$40",),
                homeProductsDetails(photo: "assets/images/kitchen1.png",name: "Glass Packge",icon: Icon(Icons.star_half),puan: "4.9", tire: "|", sold: "4.968 sold",price: "\$55",),
              ],
            ),
            Gap(15),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeProductsDetails(photo: "assets/images/chair1.png",name: "Plastic Chair",icon: Icon(Icons.star_half),puan: "4.6", tire: "|", sold: "3.678 sold",price: "\$40",),
                homeProductsDetails(photo: "assets/images/chair3.png",name: "Wooden Chair",icon: Icon(Icons.star_half),puan: "4.5", tire: "|", sold: "2.508 sold",price: "\$55",),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 0),
    );
  }

  Padding productsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/others');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "All",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/sofa');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Sofa",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/chair');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Chair",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/table');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Table",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/kitchen');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Kitchen",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/lamp');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Lamp",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/cupboard');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Cupboard",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/vase');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Vase",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}

class homeProductsDetails extends StatelessWidget {
  final String photo;
  final String name;
  final Icon icon;
  final String price;
  final String puan;
  final String tire;
  final String sold;

  const homeProductsDetails({
    required this.icon,
    required this.photo,
    required this.name,
    required this.price,
    required this.puan,
    required this.tire,
    required  this.sold,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(photo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(8),
            Text(
              name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                icon,
                Gap(6),
                Text(
                  puan,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Gap(5),
                Text(
                  tire,
                  style: TextStyle(color: Colors.black87),
                ),
                Gap(10),
                Container(
                  width: 55,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(149, 232, 232, 232)),
                  child: Center(
                      child: Text(
                    sold,
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            Gap(3),
            Text(
              price,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        
      ],
    );
  }
}
