import 'package:createNavBar/Screens/signin_screen.dart';
import 'package:createNavBar/reusable_widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Color.fromARGB(235, 252, 251, 251),
          unselectedItemColor: Color.fromARGB(255, 244, 244, 244),
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            bottomNavigationBarTitle("assets/Matches.png", 'Match'),
            bottomNavigationBarTitle("assets/Search.png", 'Search'),
            bottomNavigationBarTitle("assets/Create.png", 'Create'),
            bottomNavigationBarTitle("assets/Universe.png", 'Universe'),
            bottomNavigationBarTitle("assets/Message.png", 'Message'),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Container(height: 30.0),
            drawerListTile('My Files', 'assets/folder.png'),
            drawerListTile('My Shared with me', 'assets/people.png'),
            drawerListTile('Started', 'assets/star.png'),
            drawerListTile('Recent', 'assets/timer.png'),
            drawerListTile('Upload', 'assets/uppload.png'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 2, 6),
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 24,
          color: Color.fromARGB(234, 247, 243, 243),
        ),
        title: const Text(
          'BOO',
          style: TextStyle(
            color: Color.fromARGB(255, 248, 244, 244),
            decorationStyle: TextDecorationStyle.wavy,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          appBarIconButton('assets/notification.png'),
          appBarIconButton('assets/filter.png'),
          IconButton(
            hoverColor: Color.fromARGB(232, 243, 241, 241),
            mouseCursor: MaterialStateMouseCursor.clickable,
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Sign out ");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
            icon: Image.asset(
              'assets/power.png',
              width: 25,
              height: 25,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileContainer(screenWidth, screenHeight),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenHeight / 8.5,
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  circularContainer(context, 'assets/light.png', 45.0, 90.0),
                  circularContainer(context, 'assets/cross.png', 55.0, 90.0),
                  circularContainer(
                      context, 'assets/heart_romance.png', 45.0, 90.0),
                  circularContainer(
                      context, 'assets/love_blue.png', 55.0, 90.0),
                  circularContainer(context, 'assets/telegram.png', 45.0, 90.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
