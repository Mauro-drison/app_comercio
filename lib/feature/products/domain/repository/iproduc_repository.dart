import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProduct();
  Future<Map<String, dynamic>> modificarProductos(ProductModel product);
  Future<Map<String, dynamic>> crearProducto(ProductModel product);
  Future<Map<String, dynamic>> eliminarProducto(ProductModel product);
}
