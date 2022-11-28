import 'dart:math';
import 'package:flutter/material.dart';

import 'helper.dart';
import 'model/person.dart';

var listepersonnes = <Person>[];

class ListeViewCrud extends StatefulWidget {
  const ListeViewCrud({Key? key}) : super(key: key);

  @override
  State<ListeViewCrud> createState() => _ListeViewCrudState();
}

class _ListeViewCrudState extends State<ListeViewCrud> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listepersonnes.insert(i, getPerson(i));
    }
  }

// model d'affichage des details des informations
  Column getAlertsColumn(Person pers) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(pers.image),
              radius: 90,
            ),
            Text("M." + pers.name,
                textAlign: TextAlign.center, textScaleFactor: 2),
            Text(pers.metier, textAlign: TextAlign.center, textScaleFactor: 2),
            Text(pers.telephone.toString(),
                textAlign: TextAlign.center, textScaleFactor: 2)
          ],
        ),
      )
    ]);
  }

// recuperer les informations
  AlertDialog getAlertDialog(Person pers, BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      title: const Text(
        "Détails des Informations",
        textAlign: TextAlign.center,
        textScaleFactor: 2,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: getAlertsColumn(pers),
      actions: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded, color: Colors.red))
      ],
    );
  }

// Recuperer la liste des utilisateurs
  ListTile getListTile(
      int index, Color mycolor, BuildContext context, String item) {
    //  Random rand = Random();
    Person pers = listepersonnes[index];
    return ListTile(
      title: Text(pers.name, style: TextStyle(color: mycolor)),
      subtitle: Text(pers.metier + " " + "Tel. :" + pers.telephone.toString(),
          style: TextStyle(color: mycolor)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pers.image),
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: mycolor),
          onPressed: () {
            setState(() {
              listepersonnes.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$item a été supprimé de la liste',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.amber,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(5),
            ));
          }),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return getAlertDialog(pers, context);
            });
      },
    );
  }

// Creer une liste d'utilisateur
  ListView buildlistview() {
    Random rand = Random();
    return ListView.separated(
        itemCount: listepersonnes.length,
        itemBuilder: (context, index) {
          final pers = listepersonnes.elementAt(index);
          final item = listepersonnes.elementAt(index).name;
          var mycolor = couleurs[rand.nextInt(couleurs.length)];
          return Container(
            color: Colors.deepPurpleAccent,
            child: getListTile(index, mycolor, context, item),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.blueGrey));
  }

// Chargement des items
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listes des Utilisateurs",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: buildlistview(),
    );
  }
}
