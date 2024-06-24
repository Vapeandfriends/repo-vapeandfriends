import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductoSeleccionadoRecord extends FirestoreRecord {
  ProductoSeleccionadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Producto" field.
  DocumentReference? _producto;
  DocumentReference? get producto => _producto;
  bool hasProducto() => _producto != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "Carrito" field.
  DocumentReference? _carrito;
  DocumentReference? get carrito => _carrito;
  bool hasCarrito() => _carrito != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "sabores" field.
  List<DocumentReference>? _sabores;
  List<DocumentReference> get sabores => _sabores ?? const [];
  bool hasSabores() => _sabores != null;

  // "Categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "Colores" field.
  List<DocumentReference>? _colores;
  List<DocumentReference> get colores => _colores ?? const [];
  bool hasColores() => _colores != null;

  // "Ohm" field.
  List<DocumentReference>? _ohm;
  List<DocumentReference> get ohm => _ohm ?? const [];
  bool hasOhm() => _ohm != null;

  // "Nicotina" field.
  List<DocumentReference>? _nicotina;
  List<DocumentReference> get nicotina => _nicotina ?? const [];
  bool hasNicotina() => _nicotina != null;

  // "Modelo" field.
  List<DocumentReference>? _modelo;
  List<DocumentReference> get modelo => _modelo ?? const [];
  bool hasModelo() => _modelo != null;

  void _initializeFields() {
    _producto = snapshotData['Producto'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _carrito = snapshotData['Carrito'] as DocumentReference?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _sabores = getDataList(snapshotData['sabores']);
    _categoria = snapshotData['Categoria'] as DocumentReference?;
    _colores = getDataList(snapshotData['Colores']);
    _ohm = getDataList(snapshotData['Ohm']);
    _nicotina = getDataList(snapshotData['Nicotina']);
    _modelo = getDataList(snapshotData['Modelo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProductoSeleccionado');

  static Stream<ProductoSeleccionadoRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ProductoSeleccionadoRecord.fromSnapshot(s));

  static Future<ProductoSeleccionadoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProductoSeleccionadoRecord.fromSnapshot(s));

  static ProductoSeleccionadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductoSeleccionadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductoSeleccionadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductoSeleccionadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductoSeleccionadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductoSeleccionadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductoSeleccionadoRecordData({
  DocumentReference? producto,
  String? name,
  String? description,
  String? imagen,
  double? price,
  double? subTotal,
  DocumentReference? carrito,
  DocumentReference? creator,
  int? cantidad,
  DocumentReference? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Producto': producto,
      'name': name,
      'description': description,
      'Imagen': imagen,
      'price': price,
      'subTotal': subTotal,
      'Carrito': carrito,
      'creator': creator,
      'cantidad': cantidad,
      'Categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductoSeleccionadoRecordDocumentEquality
    implements Equality<ProductoSeleccionadoRecord> {
  const ProductoSeleccionadoRecordDocumentEquality();

  @override
  bool equals(ProductoSeleccionadoRecord? e1, ProductoSeleccionadoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.producto == e2?.producto &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imagen == e2?.imagen &&
        e1?.price == e2?.price &&
        e1?.subTotal == e2?.subTotal &&
        e1?.carrito == e2?.carrito &&
        e1?.creator == e2?.creator &&
        e1?.cantidad == e2?.cantidad &&
        listEquality.equals(e1?.sabores, e2?.sabores) &&
        e1?.categoria == e2?.categoria &&
        listEquality.equals(e1?.colores, e2?.colores) &&
        listEquality.equals(e1?.ohm, e2?.ohm) &&
        listEquality.equals(e1?.nicotina, e2?.nicotina) &&
        listEquality.equals(e1?.modelo, e2?.modelo);
  }

  @override
  int hash(ProductoSeleccionadoRecord? e) => const ListEquality().hash([
        e?.producto,
        e?.name,
        e?.description,
        e?.imagen,
        e?.price,
        e?.subTotal,
        e?.carrito,
        e?.creator,
        e?.cantidad,
        e?.sabores,
        e?.categoria,
        e?.colores,
        e?.ohm,
        e?.nicotina,
        e?.modelo
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductoSeleccionadoRecord;
}
