import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/MyNavigationDrawer.dart';

import 'Events.dart';
import 'Homepage.dart';
import 'LoginScreen.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Scaffold(
        drawer: MyNavigationDrawer(),
        appBar: AppBar(
          title: const Text('GDSC Notifications'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top : 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top:8),
                      child: Icon(Icons.notifications_active),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0,left:20),
                                child: Text(
                                  "Flutter Event @ 9AM",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "07.09.2023 - Dwarkadas J. Sanghvi",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.only(top : 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top:8),
                      child: Icon(Icons.notifications_active),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0,left:20),
                                child: Text(
                                  "Frontend Workshop @ 6PM",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "03.09.2023 - Dwarkadas J. Sanghvi",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Divider(),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_important),
                label: 'Notifications'),
          ],
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Events(),
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}
