import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    final token = await fcm.getToken();
    print(token);
  }

  @override
  void initState() {
    super.initState();
    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 76, 99),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 76, 99),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset('assets/logo/logo_appbar.png'),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Mobile',
              style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        actions: [
          badges.Badge(
            badgeContent: const Text('3'),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.yellow,
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 8),
            child: IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.search),
                hintText: 'Search here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Set your desired border radius
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/PowerBI.png'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 236, 245, 252).withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          // selectedItemColor: ,
          selectedIconTheme:
              const IconThemeData(color: Color.fromARGB(255, 74, 183, 186)),

          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 35,
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 17.5,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1505833464198-4993b36cdfab?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
              label: 'My Account',
            ),
          ],
        ),
      ),
    );
  }
}
