class ParamsAddProduct {
  ParamsAddProductBody? body;

  ParamsAddProduct({
    this.body,
  });

  ParamsAddProduct.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null
        ? ParamsAddProductBody.fromJson(json['body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body?.toJson(),
    };
  }
}

class ParamsAddProductBody {
  String? title;

  ParamsAddProductBody({
    this.title,
  });

  ParamsAddProductBody.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }
}
