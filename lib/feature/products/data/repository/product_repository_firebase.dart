import 'package:app_comercio/feature/products/data/datasource/Iproduct_remote_datasource_firebase.dart';
import 'package:app_comercio/feature/products/data/datasource/iproduct_remote.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';

import 'package:app_comercio/feature/products/domain/repository/iproduct_repository_rifebase.dart';

class ProductRepositoryFirebase implements IProductRepositoryFirebase {
  final IProductRemoteDatasourceFirebase remoteDatasource;

  ProductRepositoryFirebase(this.remoteDatasource);

  @override
  Future<List<Product>> getProducts() {
    final productList = remoteDatasource.requestProducts();
    return productList;
  }
}
