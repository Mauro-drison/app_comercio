import 'package:app_comercio/feature/products/data/datasource/iproduct_remote.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:app_comercio/core/endpoint.dart';
import 'package:intl/intl.dart';

class ProductRemoteDatasource implements IProductRemoteDatasource {
  final String _url = Endpoint.endpointproduct;
  //final String _url = 'https://www.mockachino.com/676b7631-1fb0-4f/product';
  @override
  Future<List<ProductModel>> requestProducts() async {
    Response response = await Dio().get(_url);

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      DateTime time = DateTime.now();

      final List result = response.data['products'];

      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response);
    }
  }

  @override
  Future<Map<String, dynamic>> crearProducto(ProductModel producto) async {
    try {
      // ignore: unused_local_variable
      final resp = await Dio().post(_url, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      //return {'ok': false, 'mensaje': e.response.data['error']};
      return {'ok': false, 'mensaje': e.response};
    }
  }

  @override
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto) async {
    try {
      // ignore: unused_local_variable
      final resp =
          await Dio().put("$_url/${producto.id}", data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }

  @override
  Future<Map<String, dynamic>> eliminarProducto(ProductModel producto) async {
    try {
      // ignore: unused_local_variable
      final resp =
          await Dio().delete("$_url/${producto.id}", data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }
}
