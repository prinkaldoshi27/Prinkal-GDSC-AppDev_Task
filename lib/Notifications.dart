import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            appBar: AppBar(
              title: Text('GDSC Notifications'),
              backgroundColor: Colors.purple,
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
            body: Center(child: Text('GDSC Notifications',style: TextStyle(
                fontSize: 20
            ),)),
            bottomNavigationBar: BottomNavigationBar(
              items: [
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
