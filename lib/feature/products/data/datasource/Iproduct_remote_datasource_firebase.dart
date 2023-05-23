import 'package:app_comercio/feature/products/data/model/product_model.dart';

abstract class IProductRemoteDatasourceFirebase {
  Future<List<ProductModel>> requestProducts();
}
