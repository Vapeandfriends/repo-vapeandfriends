import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "ListaCategorias" field.
  List<String>? _listaCategorias;
  List<String> get listaCategorias => _listaCategorias ?? const [];
  bool hasListaCategorias() => _listaCategorias != null;

  // "Oculto" field.
  bool? _oculto;
  bool get oculto => _oculto ?? false;
  bool hasOculto() => _oculto != null;

  // "precioAnterior" field.
  double? _precioAnterior;
  double get precioAnterior => _precioAnterior ?? 0.0;
  bool hasPrecioAnterior() => _precioAnterior != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Variaciones" field.
  List<String>? _variaciones;
  List<String> get variaciones => _variaciones ?? const [];
  bool hasVariaciones() => _variaciones != null;

  // "SeleccionaVariable" field.
  String? _seleccionaVariable;
  String get seleccionaVariable => _seleccionaVariable ?? '';
  bool hasSeleccionaVariable() => _seleccionaVariable != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _onSale = snapshotData['on_sale'] as bool?;
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _imagen = snapshotData['Imagen'] as String?;
    _listaCategorias = getDataList(snapshotData['ListaCategorias']);
    _oculto = snapshotData['Oculto'] as bool?;
    _precioAnterior = castToType<double>(snapshotData['precioAnterior']);
    _categoria = snapshotData['Categoria'] as String?;
    _variaciones = getDataList(snapshotData['Variaciones']);
    _seleccionaVariable = snapshotData['SeleccionaVariable'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  static ProductosRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductosRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'on_sale': snapshot.data['on_sale'],
          'sale_price': convertAlgoliaParam(
            snapshot.data['sale_price'],
            ParamType.double,
            false,
          ),
          'Imagen': snapshot.data['Imagen'],
          'ListaCategorias': safeGet(
            () => snapshot.data['ListaCategorias'].toList(),
          ),
          'Oculto': snapshot.data['Oculto'],
          'precioAnterior': convertAlgoliaParam(
            snapshot.data['precioAnterior'],
            ParamType.double,
            false,
          ),
          'Categoria': snapshot.data['Categoria'],
          'Variaciones': safeGet(
            () => snapshot.data['Variaciones'].toList(),
          ),
          'SeleccionaVariable': snapshot.data['SeleccionaVariable'],
        },
        ProductosRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductosRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Productos',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? name,
  String? description,
  double? price,
  bool? onSale,
  double? salePrice,
  String? imagen,
  bool? oculto,
  double? precioAnterior,
  String? categoria,
  String? seleccionaVariable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'on_sale': onSale,
      'sale_price': salePrice,
      'Imagen': imagen,
      'Oculto': oculto,
      'precioAnterior': precioAnterior,
      'Categoria': categoria,
      'SeleccionaVariable': seleccionaVariable,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.onSale == e2?.onSale &&
        e1?.salePrice == e2?.salePrice &&
        e1?.imagen == e2?.imagen &&
        listEquality.equals(e1?.listaCategorias, e2?.listaCategorias) &&
        e1?.oculto == e2?.oculto &&
        e1?.precioAnterior == e2?.precioAnterior &&
        e1?.categoria == e2?.categoria &&
        listEquality.equals(e1?.variaciones, e2?.variaciones) &&
        e1?.seleccionaVariable == e2?.seleccionaVariable;
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.onSale,
        e?.salePrice,
        e?.imagen,
        e?.listaCategorias,
        e?.oculto,
        e?.precioAnterior,
        e?.categoria,
        e?.variaciones,
        e?.seleccionaVariable
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
