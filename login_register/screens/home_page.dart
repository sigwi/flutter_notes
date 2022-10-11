import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muria/read_data/get_user_name.dart';
import 'package:muria/screens/chat_page.dart';
import 'package:muria/screens/profile_page.dart';
import 'package:muria/screens/search_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _user = FirebaseAuth.instance.currentUser!;

  //doc id list
  List<String> docIDs = [];

  //get doc id method utk mengisi list
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (Document) {
              print(Document.reference);
              docIDs.add(Document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 5,
        title: Text('${_user.email}'),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {},
                  child: Icon(Icons.search),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProfilePage.id);
                  },
                  child: Icon(Icons.account_box),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: ListTile(
                          onTap: () =>
                              Navigator.pushNamed(context, ChatPage.id),
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: Icon(Icons.person),
                          ),
                          title: GetUserName(documentId: docIDs[index]),
                          tileColor: Colors.grey[100],
                          trailing: Chip(label: Text('3')),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () {
          Navigator.pushNamed(context, SearchPage.id);
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
