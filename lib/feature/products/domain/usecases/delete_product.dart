import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/repository/iproduc_repository.dart';

class DeleteProductos {
  final IProductRepository productRepository;

  DeleteProductos(this.productRepository);
  Future<Map<String, dynamic>> deleteProductos(ProductModel product) {
    return productRepository.eliminarProducto(product);
  }
}
