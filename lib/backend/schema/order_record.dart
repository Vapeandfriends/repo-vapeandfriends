import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "precioEnvio" field.
  double? _precioEnvio;
  double get precioEnvio => _precioEnvio ?? 0.0;
  bool hasPrecioEnvio() => _precioEnvio != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "cart" field.
  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  bool hasCart() => _cart != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "productoSeleccionado" field.
  List<DocumentReference>? _productoSeleccionado;
  List<DocumentReference> get productoSeleccionado =>
      _productoSeleccionado ?? const [];
  bool hasProductoSeleccionado() => _productoSeleccionado != null;

  // "totalCompra" field.
  double? _totalCompra;
  double get totalCompra => _totalCompra ?? 0.0;
  bool hasTotalCompra() => _totalCompra != null;

  // "pagoRealizado" field.
  bool? _pagoRealizado;
  bool get pagoRealizado => _pagoRealizado ?? false;
  bool hasPagoRealizado() => _pagoRealizado != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _precioEnvio = castToType<double>(snapshotData['precioEnvio']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _cart = snapshotData['cart'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _productoSeleccionado = getDataList(snapshotData['productoSeleccionado']);
    _totalCompra = castToType<double>(snapshotData['totalCompra']);
    _pagoRealizado = snapshotData['pagoRealizado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? name,
  DateTime? createdAt,
  double? precioEnvio,
  DocumentReference? creator,
  DocumentReference? cart,
  double? amount,
  String? status,
  double? totalCompra,
  bool? pagoRealizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_at': createdAt,
      'precioEnvio': precioEnvio,
      'creator': creator,
      'cart': cart,
      'amount': amount,
      'status': status,
      'totalCompra': totalCompra,
      'pagoRealizado': pagoRealizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.precioEnvio == e2?.precioEnvio &&
        e1?.creator == e2?.creator &&
        e1?.cart == e2?.cart &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        listEquality.equals(
            e1?.productoSeleccionado, e2?.productoSeleccionado) &&
        e1?.totalCompra == e2?.totalCompra &&
        e1?.pagoRealizado == e2?.pagoRealizado;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createdAt,
        e?.precioEnvio,
        e?.creator,
        e?.cart,
        e?.amount,
        e?.status,
        e?.productoSeleccionado,
        e?.totalCompra,
        e?.pagoRealizado
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
