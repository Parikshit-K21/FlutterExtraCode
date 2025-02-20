class Product {
  final String prodId;
  final String name;
  final double price;
  final String? imageUrl;
  int quantity;

  Product({
    required this.prodId,
    required this.name,
    required this.price,
    this.quantity = 1, required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['image_url'],
      prodId: json['prod_id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prod_id': prodId,
      'name': name,
      'price': price,
      'quantity': quantity,
      // 'image_url': imageUrl,
    };
  }
}