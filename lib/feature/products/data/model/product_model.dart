import 'dart:convert';

import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/utils/datetime.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel implements Product {
  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.stardDate,
      required this.endingDate,
      required this.quantity,
      required this.image});

  @override
  int id;
  @override
  String name;
  @override
  double price;
  @override
  String stardDate;
  @override
  String endingDate;
  @override
  int quantity;
  @override
  String image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      stardDate: json["stard_date"],
      endingDate: json["ending_date"],
      quantity: json["quantity"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        //"startDate": dateToString(startDate),
        //"endingDate": dateToString(endingDate),
        "quantity": quantity,
        "image": image
      };
}
