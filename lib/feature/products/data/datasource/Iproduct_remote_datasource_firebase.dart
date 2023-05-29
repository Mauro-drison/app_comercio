import 'package:app_comercio/feature/products/data/model/product_model.dart';

abstract class IProductRemoteDatasourceFirebase {
  Future<List<ProductModel>> requestProducts();
  Future<Map<String, dynamic>> crearProducto(ProductModel producto);
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto);
  Future<Map<String, dynamic>> eliminarProducto(ProductModel producto);
}
