import 'package:app_comercio/core/services/notification_services.dart';

import 'package:app_comercio/feature/products/data/datasource/product_remote_datasource_firebase.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/data/repository/product_provider.dart';

import 'package:app_comercio/feature/products/domain/products_provider.dart';
import 'package:app_comercio/feature/products/domain/usecases/delete_product.dart';
import 'package:app_comercio/feature/products/domain/usecases/get_product.dart';
import 'package:app_comercio/feature/products/domain/usecases/post_product.dart';
import 'package:app_comercio/feature/products/domain/usecases/put_product.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  // Notifier constructor - funciones de llamada en la inicialización del proveedor
  ProductNotifier() : super(const ProductState()) {
    getProduct();
  }
  double suma = 0;
  // ignore: prefer_typing_uninitialized_variables
  var reducProducQuantity;

  getProduct() async {
    state = state.copyWith(isLoading: true);

    //final moviesList = await MovieService().fetchMovies();
    // Convert list to list of movies using the movie class constructor
    //final movies = moviesList.map((e) => Movie.fromJson(e)).toList();
    // Update state in provider
    //final product = await ProductRemoteDatasource().requestProducts();
    final product =
        await GetProducts(ProductRepository(ProductRemoteDatasourceFirebase()))
            .getProducts();

    state = state.copyWith(product: product, isLoading: false);
    inicioAgregarProductosSinStock(product);
  }

  agregarProductos(producto) async {
    state = state.copyWith(isLoading: true);
    final product = await PostProductos(
            ProductRepository(ProductRemoteDatasourceFirebase()))
        .postProductos(producto);
    final productos =
        await GetProducts(ProductRepository(ProductRemoteDatasourceFirebase()))
            .getProducts();
    agregarProductosSinStock(productos);

    state = state.copyWith(product: productos, isLoading: false);
    return product;
  }

  agregarProductoStateEliminarModificar(producto) async {
    final productos = state.updelProducts;

    state = state.copyWith(updelProducts: producto);

    //state = state.copyWith(updelProducts: productos);
  }

//primera lista vacia
  agregarProductosSinStock(product) {
    final productosSinStockk = List<ProductModel>.from(state.productSinStock);
    productosSinStockk.clear();
    for (var i in product) {
      //for (var istock in state.productSinStock) {
      //if (i.id != istock.id) {
      if (i.quantity == 0) {
        productosSinStockk.add(i);
        state = state.copyWith(productSinStock: productosSinStockk);
      }
      // }
      //}
    }
  }

  inicioAgregarProductosSinStock(product) {
    final productosSinStockk = List<ProductModel>.from(state.productSinStock);
    productosSinStockk.clear();
    for (var i in product) {
      //for (var istock in state.productSinStock) {
      //if (i.id != istock.id) {
      if (i.quantity == 0) {
        showNotificacion();

        productosSinStockk.add(i);
        state = state.copyWith(productSinStock: productosSinStockk);
      }
      // }
      //}
    }
  }

  modificarProducto(productos) async {
    // ignore: unused_local_variable
    final product =
        await PutProductos(ProductRepository(ProductRemoteDatasourceFirebase()))
            .putProductos(productos);
    final producto =
        await GetProducts(ProductRepository(ProductRemoteDatasourceFirebase()))
            .getProducts();

    agregarProductosSinStock(producto);
    state = state.copyWith(product: producto);
  }

  eliminarProductos(producto) async {
    final product = await DeleteProductos(
            ProductRepository(ProductRemoteDatasourceFirebase()))
        .deleteProductos(producto);
    final productos =
        await GetProducts(ProductRepository(ProductRemoteDatasourceFirebase()))
            .getProducts();

    state = state.copyWith(product: productos);
  }

  carritoProducts(index, products) async {
    final product = List<ProductModel>.from(state.productCarrito);
    product.add(products[index]);

    suma = products[index].price + state.totalCompra;

    state = state.copyWith(productCarrito: product, totalCompra: suma);
  }

  carritoProductsCancel(index, products) async {
    final product = List<ProductModel>.from(state.productCarrito);
    product.remove(products[index]);
    suma = 0;
    for (var i in product) {
      suma = i.price + suma;
    }
    state = state.copyWith(productCarrito: product, totalCompra: suma);
    suma = 0;
  }

  retro() {
    return "texto";
  }

  conteoProductos(productos) {
    productos = productos.length;
    return productos;
  }

  comprarProdutsDelCarrito(productsCarrito, products) async {
    // ignore: unused_local_variable
    for (var x in productsCarrito) {
      // ignore: empty_statements
      if (x.quantity == 0) {
        // ignore: avoid_print
        print("el numero ingresado no es valido");
        showNotificacion();
        state = state.copyWith(estadoQuantity: false);
        break;
      } else {
        // ignore: empty_statements
        for (var xx in products) {
          //print("${xx.id}, ${xx.quantity}");
          //print("comprar prodctos");
          //print("comprar prodctos ${x.id}, ${xx.id}");
          if (x.id == xx.id) {
            reducProducQuantity = xx.quantity - 1;
            xx.quantity = reducProducQuantity;

            // ignore: unused_local_variable
            final product = await PutProductos(
                    ProductRepository(ProductRemoteDatasourceFirebase()))
                .putProductos(xx);
            final productos = List<ProductModel>.from(state.productCarrito);
            productos.remove(xx);
            suma = 0;
            state = state.copyWith(
                productCarrito: productos,
                totalCompra: suma,
                estadoQuantity: true);
          } else {
            print(x.name);
          }
        }
      }
    }
    final productos =
        await GetProducts(ProductRepository(ProductRemoteDatasourceFirebase()))
            .getProducts();

    agregarProductosSinStock(productos);
    state = state.copyWith(product: productos);
  }
}
