part of 'models.dart';

// To parse this JSON data, do
//
//     final detailProductModel = detailProductModelFromJson(jsonString);

DetailProductModel detailProductModelFromJson(String str) =>
    DetailProductModel.fromJson(json.decode(str));

String detailProductModelToJson(DetailProductModel data) =>
    json.encode(data.toJson());

class DetailProductModel {
  DetailProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      DetailProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating!.toJson(),
      };
}
