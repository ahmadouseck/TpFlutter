class PersonModel {
  late int id;
  late String firstName;
  late String lastName;
  late int phoneNumber;

  PersonModel(this.id, this.firstName, this.lastName, this.phoneNumber);

  int get pid => id;
  set pid(int pid) => id;

  String get pfirstName => firstName;
  set pfirstName(String firstName) => firstName;

  String get plastName => lastName;
  set plastName(String lastName) => lastName;

  int get pphoneNumber => phoneNumber;
  set pphoneNumber(int phoneNumber) => phoneNumber;

  @override
  String toString() {
    return "Id: $id  Prenom : $firstName Nom : $lastName Telephone : $phoneNumber";
  }
}
