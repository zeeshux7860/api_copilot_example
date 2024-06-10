class GetAllModel {
  List<GetAllModelProducts>? products;
  int? total;
  int? skip;
  int? limit;

  GetAllModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  GetAllModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = (json['products'] as List)
          .map((e) => GetAllModelProducts.fromJson(e))
          .toList();
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class GetAllModelProducts {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  GetAllModelProductsDimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<GetAllModelProductsReviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  GetAllModelProductsMeta? meta;
  List<String>? images;
  String? thumbnail;

  GetAllModelProducts({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  GetAllModelProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    description = json['description']?.toString();
    category = json['category']?.toString();
    price = json['price']?.toDouble();
    discountPercentage = json['discountPercentage']?.toDouble();
    rating = json['rating']?.toDouble();
    stock = json['stock'];
    if (json['tags'] != null) {
      tags = (json['tags'] as List).map<String>((e) => e.toString()).toList();
    }
    brand = json['brand']?.toString();
    sku = json['sku']?.toString();
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? GetAllModelProductsDimensions.fromJson(json['dimensions'])
        : null;
    warrantyInformation = json['warrantyInformation']?.toString();
    shippingInformation = json['shippingInformation']?.toString();
    availabilityStatus = json['availabilityStatus']?.toString();
    if (json['reviews'] != null) {
      reviews = (json['reviews'] as List)
          .map((e) => GetAllModelProductsReviews.fromJson(e))
          .toList();
    }
    returnPolicy = json['returnPolicy']?.toString();
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null
        ? GetAllModelProductsMeta.fromJson(json['meta'])
        : null;
    if (json['images'] != null) {
      images =
          (json['images'] as List).map<String>((e) => e.toString()).toList();
    }
    thumbnail = json['thumbnail']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

class GetAllModelProductsDimensions {
  double? width;
  double? height;
  double? depth;

  GetAllModelProductsDimensions({
    this.width,
    this.height,
    this.depth,
  });

  GetAllModelProductsDimensions.fromJson(Map<String, dynamic> json) {
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
    depth = json['depth']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class GetAllModelProductsReviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  GetAllModelProductsReviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  GetAllModelProductsReviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment']?.toString();
    date = json['date']?.toString();
    reviewerName = json['reviewerName']?.toString();
    reviewerEmail = json['reviewerEmail']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}

class GetAllModelProductsMeta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  GetAllModelProductsMeta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  GetAllModelProductsMeta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    barcode = json['barcode']?.toString();
    qrCode = json['qrCode']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}
