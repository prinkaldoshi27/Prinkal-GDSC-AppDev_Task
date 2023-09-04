import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Notifications.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text('GDSC Events'),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
             body: Center(child: Text('GDSC Events',style: TextStyle(
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
        currentIndex: 1,
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
