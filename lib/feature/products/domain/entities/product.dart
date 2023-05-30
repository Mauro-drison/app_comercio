abstract class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.startDate,
      required this.endingDate,
      required this.quantity,
      required this.image});

  String id;

  String name;

  double price;

  String startDate;

  String endingDate;

  int quantity;

  String image;
}
