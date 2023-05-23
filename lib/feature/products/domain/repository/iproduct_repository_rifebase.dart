import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';

abstract class IProductRepositoryFirebase {
  Future<List<Product>> getProducts();
}
