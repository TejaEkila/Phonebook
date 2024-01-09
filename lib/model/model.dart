

class DataModel {
  int? id;
  late String name;
  late String surname;
  late String number;
  late String email;

  DataModel({this.id, required this.name, required this.surname, required this.number,required this.email});

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    number: json["number"],
    email: json["email"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "surname": surname,
    "number": number,
    "email":email,
  };
}
