import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CasosRecord extends FirestoreRecord {
  CasosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Asunto" field.
  String? _asunto;
  String get asunto => _asunto ?? '';
  bool hasAsunto() => _asunto != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  bool hasMail() => _mail != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _asunto = snapshotData['Asunto'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _mail = snapshotData['Mail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Casos');

  static Stream<CasosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CasosRecord.fromSnapshot(s));

  static Future<CasosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CasosRecord.fromSnapshot(s));

  static CasosRecord fromSnapshot(DocumentSnapshot snapshot) => CasosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CasosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CasosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CasosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CasosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCasosRecordData({
  String? nombre,
  String? asunto,
  String? descripcion,
  String? mail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Asunto': asunto,
      'Descripcion': descripcion,
      'Mail': mail,
    }.withoutNulls,
  );

  return firestoreData;
}

class CasosRecordDocumentEquality implements Equality<CasosRecord> {
  const CasosRecordDocumentEquality();

  @override
  bool equals(CasosRecord? e1, CasosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.asunto == e2?.asunto &&
        e1?.descripcion == e2?.descripcion &&
        e1?.mail == e2?.mail;
  }

  @override
  int hash(CasosRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.asunto, e?.descripcion, e?.mail]);

  @override
  bool isValidKey(Object? o) => o is CasosRecord;
}
