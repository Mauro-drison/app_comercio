import 'package:app_comercio/feature/products/domain/products_provider.dart';
import 'package:app_comercio/feature/products/presentation/product_satate.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
        (ref) => ProductNotifier());
