class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  static const keyId = 'id';
  static const keyName = 'pizzaName';
  static const keyDescription = 'description';
  static const keyPrice = 'price';
  static const keyImageUrl = 'imageUrl';

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName: json[keyName]?.toString() ?? 'No name',
      description: json[keyDescription]?.toString() ?? '',
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      imageUrl: json[keyImageUrl]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
    };
  }
}
