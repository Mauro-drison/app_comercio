import 'package:app_comercio/core/endpoint.dart';
import 'package:app_comercio/feature/products/data/datasource/Iproduct_remote_datasource_firebase.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';

import 'package:dio/dio.dart';

class ProductRemoteDatasourceFirebase
    implements IProductRemoteDatasourceFirebase {
  final String _url = Endpoint.endpointproductFirebase;

  @override
  Future<List<ProductModel>> requestProducts() async {
    final url = '$_url/product.json';
    Response response = await Dio().get(url);

    if (response.statusCode == 200) {
      Map data = response.data;

      // ignore: unnecessary_null_comparison
      if (data == null) return [];

      final List<ProductModel> listaProductos = [];
      //manipula el mapa dando anccion a la clave valor-- en este caso asignamos el id
      data.forEach((id, trbjo) {
        final productoTemp = ProductModel.fromJson(trbjo);
        //productoTemp.id = id;
        listaProductos.add(productoTemp);
      });

      return listaProductos;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> crearProducto(ProductModel producto) {
    // TODO: implement crearProducto
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> eliminarProducto(ProductModel producto) {
    // TODO: implement eliminarProducto
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto) {
    // TODO: implement modificarProducto
    throw UnimplementedError();
  }
}
