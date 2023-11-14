import 'package:amman_mobile_app/widgets/icon_in_card.dart';
import 'package:amman_mobile_app/widgets/image_carousel.dart';
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
      appBar: AppBar(
        flexibleSpace: Positioned.fill(
          child: Image.asset(
            'assets/images/home_upper.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/home_bottom.png'), // Replace with your image asset path
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter, // Align the image to the top
            ),
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 181, 204, 235)
                          .withOpacity(0.6),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ), // Set your desired fixed height for the card
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 0,
                  ),
                  children: const [
                    IconInCard(
                      imageIcon: 'assets/icons/SAP.png',
                      titleIcon: 'SAP/4 Hana',
                      iconType: 2,
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/SAP.png',
                      titleIcon: 'SAP SAC',
                      iconType: 2,
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/SAP.png',
                      titleIcon: 'SAP FIORI',
                      iconType: 2,
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/SAP.png',
                      titleIcon: 'SAP ARIBA',
                      iconType: 2,
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/SAI360.png',
                      titleIcon: 'SAI360',
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/PowerBI.png',
                      titleIcon: 'Power BI',
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/ChemAIer.png',
                      titleIcon: 'ChemAIer',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 136,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 181, 204, 235)
                          .withOpacity(0.6),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ), // Set your desired fixed height for the card
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconInCard(
                      imageIcon: 'assets/icons/approval.png',
                      titleIcon: 'My Pending Approval',
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/boat.png',
                      titleIcon: 'Boat Booking',
                    ),
                    IconInCard(
                      imageIcon: 'assets/icons/plane.png',
                      titleIcon: 'Seaplane Booking',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const ImageCarousel(),
            ],
          ),
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
