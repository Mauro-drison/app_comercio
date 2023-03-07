import 'package:app_comercio/feature/products/data/datasource/product_remote.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/data/repository/product_provider.dart';
import 'package:app_comercio/feature/products/domain/products_provider.dart';
import 'package:app_comercio/feature/products/domain/usecases/get_product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  // Notifier constructor - funciones de llamada en la inicialización del proveedor
  ProductNotifier() : super(ProductState()) {
    print("estado inmutable");
    getProduct();
  }
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
    print("ESTADO PRODUCTOS");
    state = state.copyWith(product: product, isLoading: false);
  }

  agregarProductos(producto) async {
    state = state.copyWith(isLoading: true);
    final product = await ProductRemoteDatasource().crearProducto(producto);
    final productos = List<ProductModel>.from(state.product);
    productos.add(producto);
    state = state.copyWith(product: productos, isLoading: false);
  }

  modificarProducto() async {
    //final product = await ProductRemoteDatasource().modificarProducto(producto);
  }
}
