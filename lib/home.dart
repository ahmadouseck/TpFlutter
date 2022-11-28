import 'package:flutter/material.dart';
import 'package:tpcard/crudlistview/crud.dart';
import 'package:tpcard/generate_wordlist/listword.dart';
import 'package:tpcard/generate_wordlist_interactive/listword.dart';
import 'package:tpcard/hive_db/helper_hivedb.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "HOME",
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Image.asset(
            'images/logo.jpg',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text("Universite Iba Der Thiam de Thies",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 5,
        ),
        const Text("Cours DVA",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                  child: Text('MY WORKS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
            ),
            ListTile(
              title: const Text('ListViewCrud',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ListeViewCrud()));
              },
            ),
            ListTile(
              title: const Text('Hive DB',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const HiveDb()));
              },
            ),
            ListTile(
              title: const Text('Generate Word',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WordList()));
              },
            ),
            ListTile(
              title: const Text('Generate Word Interactive',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WordListInteractive()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
