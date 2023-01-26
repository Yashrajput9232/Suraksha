class Item {
  String? number;
  String? name;
  String? relation;

  Item({this.number, this.name, this.relation});

  Item.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['relation'] = relation;
    return data;
  }
}
