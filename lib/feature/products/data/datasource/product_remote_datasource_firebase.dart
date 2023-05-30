import 'package:app_comercio/core/endpoint.dart';
import 'package:app_comercio/feature/products/data/datasource/Iproduct_remote_datasource_firebase.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/utils/double.dart';

import 'package:dio/dio.dart';

class ProductRemoteDatasourceFirebase
    implements IProductRemoteDatasourceFirebase {
  final String _url = Endpoint.endpointproductFirebase;

  @override
  Future<List<ProductModel>> requestProducts() async {
    final url = '$_url/product.json';
    Response response = await Dio().get(url);
    print("datarouce");
    if (response.statusCode == 200) {
      Map data = response.data;
      print("datarouce");
      // ignore: unnecessary_null_comparison
      if (data == null) return [];

      final List<ProductModel> listaProductos = [];
      //manipula el mapa dando anccion a la clave valor-- en este caso asignamos el id
      data.forEach((id, trbjo) {
        //print("se imprime datasource${trbjo.id}");
        //var valor = checkDouble(trbjo.picre);
        //trbjo.price = valor;
        //print(valor);
        final productoTemp = ProductModel.fromJson(trbjo);
        //print("se data${productoTemp.id}");

        productoTemp.id = id;
        //print("se data${productoTemp.id}");
        listaProductos.add(productoTemp);
      });

      return listaProductos;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> crearProducto(ProductModel producto) async {
    try {
      final url = '$_url/product.json';
      final resp = await Dio().post(url, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      //return {'ok': false, 'mensaje': e.response.data['error']};
      return {'ok': false, 'mensaje': e.response};
    }
  }

  @override
  Future<Map<String, dynamic>> eliminarProducto(ProductModel product) async {
    print("datasource eliminar");
    print("${product.id}");
    try {
      print("datasource eliminar");
      final url = '$_url/product/${product.id}.json';
      final resp = await Dio().delete(url, data: product.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }

  @override
  Future<Map<String, dynamic>> modificarProducto(ProductModel product) async {
    try {
      final url = '$_url/product/${product.id}.json';
      // ignore: unused_local_variable
      final resp = await Dio().put(url, data: product.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }
}
