import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(113, 37, 182, 255),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/appstore.png'),
              ),
              const Text(
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 50,
                  color: Colors.white,
                ),
                'Angela Yu',
              ),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.fingerprint,
                        size: 30,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'sigitlovesangela@gmail.com',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone_android,
                        size: 30,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        '+62 9169 6969 6969',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.indigo,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    size: 40,
                  ),
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
