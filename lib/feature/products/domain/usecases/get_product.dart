import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/domain/repository/iproduc_repository.dart';

class GetProducts {
  final IProductRepository productRepository;

  GetProducts(this.productRepository);

  Future<List<Product>> getProducts() {
    return productRepository.getProduct();
  }
}
