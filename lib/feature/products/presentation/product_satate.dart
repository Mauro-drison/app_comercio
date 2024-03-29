import 'package:app_comercio/core/services/notification_services.dart';
import 'package:app_comercio/feature/products/data/datasource/product_remote.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/data/repository/product_provider.dart';

import 'package:app_comercio/feature/products/domain/products_provider.dart';
import 'package:app_comercio/feature/products/domain/usecases/get_product.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  // Notifier constructor - funciones de llamada en la inicialización del proveedor
  ProductNotifier() : super(const ProductState()) {
    print("estado inmutable");
    getProduct();
  }
  double suma = 0;
  // ignore: prefer_typing_uninitialized_variables
  var reducProducQuantity;

  getProduct() async {
    state = state.copyWith(isLoading: true);
    print("obtener productos");
    //final moviesList = await MovieService().fetchMovies();
    // Convert list to list of movies using the movie class constructor
    //final movies = moviesList.map((e) => Movie.fromJson(e)).toList();
    // Update state in provider
    //final product = await ProductRemoteDatasource().requestProducts();
    final product =
        await GetProducts(ProductRepository(ProductRemoteDatasource()))
            .getProducts();
    print("ESTADO PRODUCTOS $product");
    state = state.copyWith(product: product, isLoading: false);
    agregarProductosSinStock(product);
  }

//primera lista vacia
  agregarProductosSinStock(product) {
    for (var i in product) {
      //for (var istock in state.productSinStock) {
      //if (i.id != istock.id) {
      if (i.quantity == 0) {
        showNotificacion();
        print(i.name);
        final productosSinStockk =
            List<ProductModel>.from(state.productSinStock);
        productosSinStockk.add(i);
        state = state.copyWith(productSinStock: productosSinStockk);
      }
      // }
      //}
    }
  }

  agregarProductos(producto) async {
    state = state.copyWith(isLoading: true);
    final product = await ProductRemoteDatasource().crearProducto(producto);
    final productos = List<ProductModel>.from(state.product);
    productos.add(producto);
    state = state.copyWith(product: productos, isLoading: false);
  }

  modificarProducto(productos) async {
    //final product = await ProductRemoteDatasource().modificarProducto(producto);
  }

  carritoProducts(index, products) async {
    final product = List<ProductModel>.from(state.productCarrito);
    product.add(products[index]);
    print(products[index].price);
    suma = products[index].price + state.totalCompra;
    print(suma);
    state = state.copyWith(productCarrito: product, totalCompra: suma);
    print("state $product");
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
          if (x.id == xx.id) {
            print("el producto es correcto ${x.name}");
            reducProducQuantity = xx.quantity - 1;
            xx.quantity = reducProducQuantity;
            // ignore: unused_local_variable
            final product =
                await ProductRemoteDatasource().modificarProducto(xx);
            final productos = List<ProductModel>.from(state.productCarrito);
            productos.remove(xx);
            suma = 0;
            state = state.copyWith(
                productCarrito: productos,
                totalCompra: suma,
                estadoQuantity: true);

            print("completo");
          } else {
            print(x.name);
          }
        }
      }
    }
  }
}
