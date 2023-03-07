abstract class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.stardDate,
      required this.endingDate,
      required this.quantity,
      required this.image});

  int id;

  String name;

  double price;

  String stardDate;

  String endingDate;

  int quantity;

  String image;
}
