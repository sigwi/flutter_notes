import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muria/read_data/get_user_name.dart';
import 'package:muria/screens/chat_page.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'search_page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //doc id list
  List<String> docIDs = [];

  //get doc id method
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
        title: Text('Find Contact'),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.find_in_page),
            ),
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
                          onTap: () {},
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: Icon(Icons.person),
                          ),
                          title: GetUserName(documentId: docIDs[index]),
                          tileColor: Colors.grey[100],
                          trailing: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, ChatPage.id),
                            child: Chip(label: Text('Chat')),
                          ),
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
    );
  }
}
