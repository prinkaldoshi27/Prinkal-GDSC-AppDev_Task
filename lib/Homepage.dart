import 'package:flutter/material.dart';
import 'Notifications.dart';
import 'Events.dart';

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
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
            body: Center(child: Text('GDSC Homepagae',style: TextStyle(
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
