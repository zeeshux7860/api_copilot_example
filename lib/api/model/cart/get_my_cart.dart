class GetMyCartModel {
  List<GetMyCartModelCarts>? carts;
  int? total;
  int? skip;
  int? limit;

  GetMyCartModel({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  GetMyCartModel.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = (json['carts'] as List)
          .map((e) => GetMyCartModelCarts.fromJson(e))
          .toList();
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    return {
      'carts': carts?.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class GetMyCartModelCarts {
  int? id;
  List<GetMyCartModelCartsProducts>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  GetMyCartModelCarts({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  GetMyCartModelCarts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = (json['products'] as List)
          .map((e) => GetMyCartModelCartsProducts.fromJson(e))
          .toList();
    }
    total = json['total']?.toDouble();
    discountedTotal = json['discountedTotal']?.toDouble();
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products?.map((e) => e.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}

class GetMyCartModelCartsProducts {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  GetMyCartModelCartsProducts({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  GetMyCartModelCartsProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    price = json['price']?.toDouble();
    quantity = json['quantity'];
    total = json['total']?.toDouble();
    discountPercentage = json['discountPercentage']?.toDouble();
    discountedTotal = json['discountedTotal']?.toDouble();
    thumbnail = json['thumbnail']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }
}
