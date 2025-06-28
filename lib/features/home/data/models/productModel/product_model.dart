class ProductModel {
  final String image;
  final String title;
  final String description;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewCount;

  ProductModel({
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
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}
