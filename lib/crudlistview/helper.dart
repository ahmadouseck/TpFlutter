import 'dart:math';

import 'package:flutter/material.dart';

import 'model/person.dart';

final couleurs = [
  Colors.yellow,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.cyan
];

final prenoms = ["Amadou", "Mohamed", "Modou", "Moussa", "Jean", "Madior"];

var noms = ["Seck", "Ndiaye", "Diaw", "Sarr", "Sonko", "Ciss"];

var metiers = [
  "Informaticien",
  "Etudiant",
  "Chauffeur",
  "Journaliste",
  "Vendeur",
  "Maçon"
];

Person getPerson(int id) {
  Random rand = Random();
  int telephone = 780000000 + rand.nextInt(9999999);
  String image = "https://randomuser.me/api/portraits/men/" +
      rand.nextInt(100).toString() +
      ".jpg";
  Person pers = Person(
      id,
      prenoms[rand.nextInt(prenoms.length)] +
          " " +
          noms[rand.nextInt(noms.length)],
      metiers[rand.nextInt(metiers.length)],
      telephone,
      image);
  return pers;
}
