import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "productosCount" field.
  int? _productosCount;
  int get productosCount => _productosCount ?? 0;
  bool hasProductosCount() => _productosCount != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "productoSeleccionadoList" field.
  List<DocumentReference>? _productoSeleccionadoList;
  List<DocumentReference> get productoSeleccionadoList =>
      _productoSeleccionadoList ?? const [];
  bool hasProductoSeleccionadoList() => _productoSeleccionadoList != null;

  // "precioEnvio" field.
  double? _precioEnvio;
  double get precioEnvio => _precioEnvio ?? 0.0;
  bool hasPrecioEnvio() => _precioEnvio != null;

  // "textoEnvio" field.
  String? _textoEnvio;
  String get textoEnvio => _textoEnvio ?? '';
  bool hasTextoEnvio() => _textoEnvio != null;

  // "cuantofaltaenvio" field.
  double? _cuantofaltaenvio;
  double get cuantofaltaenvio => _cuantofaltaenvio ?? 0.0;
  bool hasCuantofaltaenvio() => _cuantofaltaenvio != null;

  // "totalCompra" field.
  double? _totalCompra;
  double get totalCompra => _totalCompra ?? 0.0;
  bool hasTotalCompra() => _totalCompra != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _productosCount = castToType<int>(snapshotData['productosCount']);
    _isActive = snapshotData['isActive'] as bool?;
    _amount = castToType<double>(snapshotData['amount']);
    _productoSeleccionadoList =
        getDataList(snapshotData['productoSeleccionadoList']);
    _precioEnvio = castToType<double>(snapshotData['precioEnvio']);
    _textoEnvio = snapshotData['textoEnvio'] as String?;
    _cuantofaltaenvio = castToType<double>(snapshotData['cuantofaltaenvio']);
    _totalCompra = castToType<double>(snapshotData['totalCompra']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carrito');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  DocumentReference? creator,
  int? productosCount,
  bool? isActive,
  double? amount,
  double? precioEnvio,
  String? textoEnvio,
  double? cuantofaltaenvio,
  double? totalCompra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'productosCount': productosCount,
      'isActive': isActive,
      'amount': amount,
      'precioEnvio': precioEnvio,
      'textoEnvio': textoEnvio,
      'cuantofaltaenvio': cuantofaltaenvio,
      'totalCompra': totalCompra,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creator == e2?.creator &&
        e1?.productosCount == e2?.productosCount &&
        e1?.isActive == e2?.isActive &&
        e1?.amount == e2?.amount &&
        listEquality.equals(
            e1?.productoSeleccionadoList, e2?.productoSeleccionadoList) &&
        e1?.precioEnvio == e2?.precioEnvio &&
        e1?.textoEnvio == e2?.textoEnvio &&
        e1?.cuantofaltaenvio == e2?.cuantofaltaenvio &&
        e1?.totalCompra == e2?.totalCompra;
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality().hash([
        e?.creator,
        e?.productosCount,
        e?.isActive,
        e?.amount,
        e?.productoSeleccionadoList,
        e?.precioEnvio,
        e?.textoEnvio,
        e?.cuantofaltaenvio,
        e?.totalCompra
      ]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
