

class ProductModel {
  final String id;
  final String image;
  final String title;
  final String description;
  final num price;
  final String oldPrice;
  final String rating;
  final String reviewCount;
  final String section;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewCount,
    required this.section,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      section: json['section'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'rating': rating,
      'reviewCount': reviewCount,
      'section': section,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
