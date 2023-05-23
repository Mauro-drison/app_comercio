import 'package:app_comercio/core/endpoint.dart';
import 'package:app_comercio/feature/products/data/datasource/Iproduct_remote_datasource_firebase.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:dio/dio.dart';

class ProductRemoteDatasourceFirebase
    implements IProductRemoteDatasourceFirebase {
  final String _url = Endpoint.endpointproductFirebase;

  @override
  Future<List<ProductModel>> requestProducts() async {
    final url = '$_url/product.json';
    Response response = await Dio().get(url);

    if (response.statusCode == 200) {
      print(response);
      Map data = response.data;
      print(data);
      // ignore: unnecessary_null_comparison
      if (data == null) return [];

      final List<ProductModel> listaProductos = [];
      //manipula el mapa dando anccion a la clave valor-- en este caso asignamos el id
      data.forEach((id, trbjo) {
        print("$id <= numero del id");
        final productoTemp = ProductModel.fromJson(trbjo);
        //productoTemp.id = id;
        listaProductos.add(productoTemp);
        print(productoTemp.price);
      });
      print(listaProductos);
      return listaProductos;
    } else {
      throw Exception();
    }
  }
}
