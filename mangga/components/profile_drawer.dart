// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Profile'),
                      SizedBox(height: 10),
                      Text('Visit'),
                    ],
                  )
                ],
              ),
            ),
          ),
          //drawer body
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
          )
        ],
      ),
    );
  }
}
