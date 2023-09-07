import 'package:flutter/material.dart';
import 'package:gdsc_app/LoginScreen.dart';
import 'MyNavigationDrawer.dart';
import 'Notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Events.dart';
import 'package:rive/rive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Scaffold(
        appBar: AppBar(
          title: Text('GDSC Homepage'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
        drawer: MyNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Google Developer Students Club",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    height: 400,
                    width: double.infinity,
                    child: RiveAnimation.asset("assets/animation.riv")),
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_important),
                label: 'Notifications'),
          ],
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Events(),
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Notifications(),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}
