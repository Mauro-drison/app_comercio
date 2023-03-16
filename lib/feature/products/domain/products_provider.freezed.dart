// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  List<Product> get product => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<Product> get productCarrito => throw _privateConstructorUsedError;
  double get totalCompra => throw _privateConstructorUsedError;
  bool get estadoQuantity => throw _privateConstructorUsedError;
  List<Product> get productSinStock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {List<Product> product,
      bool isLoading,
      List<Product> productCarrito,
      double totalCompra,
      bool estadoQuantity,
      List<Product> productSinStock});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isLoading = null,
    Object? productCarrito = null,
    Object? totalCompra = null,
    Object? estadoQuantity = null,
    Object? productSinStock = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productCarrito: null == productCarrito
          ? _value.productCarrito
          : productCarrito // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalCompra: null == totalCompra
          ? _value.totalCompra
          : totalCompra // ignore: cast_nullable_to_non_nullable
              as double,
      estadoQuantity: null == estadoQuantity
          ? _value.estadoQuantity
          : estadoQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      productSinStock: null == productSinStock
          ? _value.productSinStock
          : productSinStock // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$_ProductStateCopyWith(
          _$_ProductState value, $Res Function(_$_ProductState) then) =
      __$$_ProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product> product,
      bool isLoading,
      List<Product> productCarrito,
      double totalCompra,
      bool estadoQuantity,
      List<Product> productSinStock});
}

/// @nodoc
class __$$_ProductStateCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductState>
    implements _$$_ProductStateCopyWith<$Res> {
  __$$_ProductStateCopyWithImpl(
      _$_ProductState _value, $Res Function(_$_ProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isLoading = null,
    Object? productCarrito = null,
    Object? totalCompra = null,
    Object? estadoQuantity = null,
    Object? productSinStock = null,
  }) {
    return _then(_$_ProductState(
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productCarrito: null == productCarrito
          ? _value._productCarrito
          : productCarrito // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalCompra: null == totalCompra
          ? _value.totalCompra
          : totalCompra // ignore: cast_nullable_to_non_nullable
              as double,
      estadoQuantity: null == estadoQuantity
          ? _value.estadoQuantity
          : estadoQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      productSinStock: null == productSinStock
          ? _value._productSinStock
          : productSinStock // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_ProductState extends _ProductState {
  const _$_ProductState(
      {final List<Product> product = const [],
      this.isLoading = true,
      final List<Product> productCarrito = const [],
      this.totalCompra = 0,
      this.estadoQuantity = true,
      final List<Product> productSinStock = const []})
      : _product = product,
        _productCarrito = productCarrito,
        _productSinStock = productSinStock,
        super._();

  final List<Product> _product;
  @override
  @JsonKey()
  List<Product> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  @JsonKey()
  final bool isLoading;
  final List<Product> _productCarrito;
  @override
  @JsonKey()
  List<Product> get productCarrito {
    if (_productCarrito is EqualUnmodifiableListView) return _productCarrito;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productCarrito);
  }

  @override
  @JsonKey()
  final double totalCompra;
  @override
  @JsonKey()
  final bool estadoQuantity;
  final List<Product> _productSinStock;
  @override
  @JsonKey()
  List<Product> get productSinStock {
    if (_productSinStock is EqualUnmodifiableListView) return _productSinStock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productSinStock);
  }

  @override
  String toString() {
    return 'ProductState(product: $product, isLoading: $isLoading, productCarrito: $productCarrito, totalCompra: $totalCompra, estadoQuantity: $estadoQuantity, productSinStock: $productSinStock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductState &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._productCarrito, _productCarrito) &&
            (identical(other.totalCompra, totalCompra) ||
                other.totalCompra == totalCompra) &&
            (identical(other.estadoQuantity, estadoQuantity) ||
                other.estadoQuantity == estadoQuantity) &&
            const DeepCollectionEquality()
                .equals(other._productSinStock, _productSinStock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_product),
      isLoading,
      const DeepCollectionEquality().hash(_productCarrito),
      totalCompra,
      estadoQuantity,
      const DeepCollectionEquality().hash(_productSinStock));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      __$$_ProductStateCopyWithImpl<_$_ProductState>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState(
      {final List<Product> product,
      final bool isLoading,
      final List<Product> productCarrito,
      final double totalCompra,
      final bool estadoQuantity,
      final List<Product> productSinStock}) = _$_ProductState;
  const _ProductState._() : super._();

  @override
  List<Product> get product;
  @override
  bool get isLoading;
  @override
  List<Product> get productCarrito;
  @override
  double get totalCompra;
  @override
  bool get estadoQuantity;
  @override
  List<Product> get productSinStock;
  @override
  @JsonKey(ignore: true)
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
