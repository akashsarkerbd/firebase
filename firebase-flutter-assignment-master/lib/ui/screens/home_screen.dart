import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/ui/models/match.dart';
import 'package:firebase_test/ui/screens/match_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference =
      firebaseFirestore.collection("matches");

  List<Matches> matchList = [];

  @override
  void initState() {
    super.initState();
    getMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Match List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: matchList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchDetailScreen(
                        match: matchList[index],
                      ),
                    ),
                  );
                },
                leading: Text(matchList[index].name),
                trailing: const Icon(Icons.arrow_forward_rounded),
              ),
            );
          }),
    );
  }

  Future<void> getMatch() async {
    final QuerySnapshot matches = await collectionReference.get();
    for (QueryDocumentSnapshot element in matches.docs) {
      Matches match = Matches(
        element.get("name"),
        element.get("goal"),
        element.get("time"),
        element.get("total_time"),
      );
      matchList.add(match);
    }
    if (mounted) {
      setState(() {});
    }
  }
}
