class Person {
  late int id;
  late String name;
  late String metier;
  late int telephone;
  late String image;

  Person(this.id, this.name, this.metier, this.telephone, this.image);

  int get pid => id;
  set mid(int id) => id;

  String get pname => name;
  set pname(String name) => name;

  int get ptelephone => telephone;
  set ptelephone(int telephone) => telephone;

  String get pmetier => metier;
  set pmetier(String metier) => metier;

  String get pimage => image;
  set pimage(String image) => image;
}
