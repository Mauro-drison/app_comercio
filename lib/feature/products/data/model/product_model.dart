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
      required this.startDate,
      required this.endingDate,
      required this.quantity,
      required this.image});

  @override
  String id;
  @override
  String name;
  @override
  num price;
  @override
  String startDate;
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
      startDate: json["start_date"],
      endingDate: json["ending_date"],
      quantity: json["quantity"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "start_date": startDate,
        "ending_date": endingDate,
        "quantity": quantity,
        "image": image
      };
}
