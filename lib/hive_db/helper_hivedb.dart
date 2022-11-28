import 'package:flutter/material.dart';
import 'package:tpcard/hive_db/person_model.dart';

class HiveDb extends StatefulWidget {
  const HiveDb({Key? key}) : super(key: key);

  @override
  State<HiveDb> createState() => _HiveDbState();
}

class _HiveDbState extends State<HiveDb> {
  var title = "Hive Database";
  var idController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var phoneController = TextEditingController();

  List<PersonModel> listePersonnes = <PersonModel>[];

  TextField getTextField(TextInputType type, String hint, String label,
      TextEditingController controller, IconData iconData) {
    return TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
          hintText: hint,
          labelText: label,
        ));
  }

  CreatePerson() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 10,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  getTextField(TextInputType.number, "Entrez l'id", "ID",
                      idController, Icons.perm_identity),
                  getTextField(TextInputType.text, "Entrez le prenom", "Prenom",
                      firstnameController, Icons.person),
                  getTextField(TextInputType.text, "Entrez le nom ", "Nom",
                      lastnameController, Icons.person),
                  getTextField(TextInputType.text, "Entrez le numéro ",
                      "Téléphone", phoneController, Icons.phone),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          elevation: 4,
                        ),
                        child: const Text("Valider",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          final id = idController.text;
                          final fname = firstnameController.text;
                          final lname = lastnameController.text;
                          final phone = phoneController.text;
                          setState(() {
                            PersonModel pers = PersonModel(
                                int.parse(id), fname, lname, int.parse(phone));
                            listePersonnes.add(pers);
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          elevation: 4,
                        ),
                        child: const Text("Annuler",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: listePersonnes.length,
        itemBuilder: (BuildContext context, int index) {
          PersonModel pers = listePersonnes[index];
          return Container(
              color: Colors.amberAccent,
              child: ListTile(
                trailing: IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: () {
                    setState(() {
                      listePersonnes.removeAt(index);
                    });
                  },
                ),
                title: Text(pers.id.toString() +
                    " " +
                    pers.firstName +
                    " " +
                    pers.lastName),
                subtitle: Text(pers.phoneNumber.toString()),
              ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Ajout",
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () => CreatePerson(),
      ),
    );
  }
}
