import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/repository/iproduc_repository.dart';

class PutProductos {
  final IProductRepository productRepository;

  PutProductos(this.productRepository);
  Future<Map<String, dynamic>> putProductos(ProductModel product) {
    return productRepository.modificarProductos(product);
  }
}
