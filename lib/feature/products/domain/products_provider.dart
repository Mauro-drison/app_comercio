import 'dart:convert';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//Importar archivo congelado (tal vez aún no generado)
part 'products_provider.freezed.dart';

//Creando un estado donde la anotación congelada sugerirá que se debe generar un código repetitivo
@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<Product> product,
    @Default(true) bool isLoading,
    @Default([]) List<Product> productCarrito,
    @Default(0) double totalCompra,
    @Default(true) bool estadoQuantity,
  }) = _ProductState;

  const ProductState._();
}
