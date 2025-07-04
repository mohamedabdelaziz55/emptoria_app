class ProductModel {
  final String id; // إضافة معرف فريد
  final String image;
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String rating;
  final String reviewCount;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}