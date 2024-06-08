import 'package:flutter/material.dart';
import 'package:funica_mobile/core/cache.dart';
import 'package:gap/gap.dart';
import 'package:grock/grock.dart';
import '../../widgets/bottomNavigation.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Map<String, dynamic> pageConfig = {};
  bool configLoaded = false;

  loadData() async {
    CacheSystem cs = CacheSystem();
    final pageConfig = await cs.getOrdersConfig();

    setState(() {
      this.pageConfig = pageConfig;
      configLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return !configLoaded
        ? const SizedBox()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
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
                        Gap(3),
                        Padding(
                          padding: const EdgeInsets.only(top: 62),
                          child: Text(
                            "My Orders",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(), // Add this to take up the extra space
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child:
                              Icon(Icons.search_rounded, color: Colors.black87),
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(top: 55, right: 14),
                          child: Icon(Icons.pending_outlined,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 490,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(23, 158, 158, 158),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    pageConfig["photo1"],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            pageConfig["title1"],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(155, 0, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["description1"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(170, 50, 49, 49),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["fiyat1"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: 15.onlyRightP,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(194, 247, 247, 247),
                                                border: Border.all(
                                                    color: Color.fromARGB(255, 7, 3, 136)),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                pageConfig["sepet1"],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(255, 1, 1, 249),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 490,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(23, 158, 158, 158),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    pageConfig["photo2"],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            pageConfig["title2"],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(155, 0, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["description2"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(170, 50, 49, 49),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["fiyat2"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: 15.onlyRightP,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(194, 247, 247, 247),
                                                border: Border.all(
                                                    color: Color.fromARGB(255, 7, 3, 136)),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                pageConfig["sepet2"],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(255, 1, 1, 249),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 490,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(23, 158, 158, 158),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    pageConfig["photo3"],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            pageConfig["title3"],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(155, 0, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["description3"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(170, 50, 49, 49),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        pageConfig["fiyat3"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: 15.onlyRightP,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(194, 247, 247, 247),
                                                border: Border.all(
                                                    color: Color.fromARGB(255, 7, 3, 136)),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                pageConfig["sepet3"],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(255, 1, 1, 249),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigator(selectedIndex: 2),
          );
  }
}

