class Product{
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Format to send data to firebase
  Map<String, dynamic> toMap() {
    return {
      "name":name,
      "description" : description,
      "price" : price,
      "imageUrl" : imageUrl
    };
  }

  // Format to retrieve data from firebase
  Product.fromMap(Map<String,dynamic> map) 
        : name = map['name'] ?? "",
          description = map['description'] ?? "",
          price = map["price"] ?? 0.0,
          imageUrl = map["imageUrl"] ?? "";

}
