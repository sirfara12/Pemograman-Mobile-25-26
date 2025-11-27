class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imageUrl;


  int? size;

  Pizza();

   Pizza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pizzaName = json['pizzaName'];
    description = json['description'];
    price = (json['price'] is int)
        ? (json['price'] as int).toDouble()
        : json['price'];
    imageUrl = json['imageUrl'];
    size = json['size'] is String ? int.tryParse(json['size']) : json['size'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'size': size,
    };
  }

}
