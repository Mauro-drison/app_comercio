import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/repository/iproduc_repository.dart';

class PostProductos {
  final IProductRepository productRepository;

  PostProductos(this.productRepository);
  Future<Map<String, dynamic>> postProductos(ProductModel product) {
    return productRepository.crearProducto(product);
  }
}
