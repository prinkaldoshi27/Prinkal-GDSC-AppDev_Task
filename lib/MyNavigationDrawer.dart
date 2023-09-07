import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/Events.dart';
import 'Homepage.dart';
import 'Notifications.dart';

class MyNavigationDrawer extends StatelessWidget {
  MyNavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(

    backgroundColor: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, bottom: 28),
        child: Image.asset("assets/gdsc-social-share-removebg.png")),
        Text(""),
      ],
    );
    //   child: Image.network(
    //       'https://developers.google.com/community/gdsc/images/gdsc-social-share.png'),
    // );
  }

  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          iconColor: Colors.deepPurple,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Homepage(),
            ));
          }),
      ListTile(
          leading: const Icon(Icons.self_improvement_rounded),
          title: const Text(
            'Events',
          ),
          iconColor: Colors.deepPurple,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Events(),
            ));
          }),
      ListTile(
          leading: const Icon(Icons.medical_services_outlined),
          title: const Text(
            'Notification',
          ),
          iconColor: Colors.deepPurple,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Notifications(),
            ));
          }),
      const Divider(color: Colors.black),
      ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'Logout',
          ),
          iconColor: Colors.deepPurple,
          onTap: () {
            FirebaseAuth.instance.signOut();
          }),

    ],
  );
}
