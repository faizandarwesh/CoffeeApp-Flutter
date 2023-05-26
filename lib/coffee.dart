class Coffee{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Coffee({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl
  });

  factory Coffee.fromJson(json) => Coffee(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["imageUrl"],
  );

   Map<String,dynamic> toJson() => {
     "id" : id,
     "title" : title,
     "description" : description,
     "price" : price,
     "imageUrl" : imageUrl
   };

}