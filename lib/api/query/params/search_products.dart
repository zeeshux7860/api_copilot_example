class ParamsSearchProducts {
  ParamsSearchProductsQuery? query;

  ParamsSearchProducts({
    this.query,
  });

  ParamsSearchProducts.fromJson(Map<String, dynamic> json) {
    query = json['query'] != null
        ? ParamsSearchProductsQuery.fromJson(json['query'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'query': query?.toJson(),
    };
  }
}

class ParamsSearchProductsQuery {
  String? q;

  ParamsSearchProductsQuery({
    this.q,
  });

  ParamsSearchProductsQuery.fromJson(Map<String, dynamic> json) {
    q = json['q']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'q': q,
    };
  }
}
