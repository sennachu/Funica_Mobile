import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grock/grock.dart';
import '../../widgets/bottomNavigation.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(), // Add this to take up the extra space
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Icon(Icons.search_rounded, color: Colors.black87),
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, right: 14),
                    child: Icon(Icons.pending_outlined, color: Colors.black87),
                  ),
                ],
              ),
            ),
            SepetItem("assets/images/lamp5.png", "Parabolic Reflector", "Brown",
                "\$240", "In Delivery", "Track Order"),
            SizedBox(
              height: 2,
            ),
            SepetItem("assets/images/sofa2.png", "Mid Century Sofa", "Green",
                "\$449", "In Delivery", "Track Order"),
            SizedBox(
              height: 2,
            ),
            SepetItem("assets/images/lamp4.png", "Parabolic Reflector", "Brown", "\$449",
                "In Delivery", "Track Order"),
            SizedBox(
              height: 2,
            ),
            SepetItem("assets/images/vase3.png", "Vase", "White", "\$180",
                "In Delivery", "Track Order"),
            SizedBox(
              height: 2,
            ),
            SepetItem("assets/images/table4.png", "Mini Wooden Table", "Brown",
                "\$320", "In Delivery", "Track Order"),
            SizedBox(
              height: 2,
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 2),
    );
  }
}

Widget SepetItem(
        String photo,
        String title,
        String description,
        String fiyat, //sepet için tekrarlamaları önlemek adına widget yazdım
        String beden,
        String sepet) =>
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
                    photo,
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
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(155, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(170, 50, 49, 49),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        fiyat,
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
                                sepet,
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
    );
