import 'dart:convert';



Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.id,
    required this.name,
    required this.number,
    required this.relation,
  });
  String id;
  String name;
  String number;
  String relation;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        relation: json["relation"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "relation": relation,
      };
}
