import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Gap(10),
                Icon(
                  Icons.waving_hand,
                  size: 20,
                  color: Colors.amber,
                ),
              ],
            ),
            Gap(5),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              
            ),
          ),
        ],
      ),
      
    );
  }
}
