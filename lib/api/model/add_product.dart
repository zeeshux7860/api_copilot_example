class AddProductModel {
  int? id;
  String? title;

  AddProductModel({
    this.id,
    this.title,
  });

  AddProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
