import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MunicipiosRecord extends FirestoreRecord {
  MunicipiosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  bool hasMunicipio() => _municipio != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _municipio = snapshotData['municipio'] as String?;
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Municipios');

  static Stream<MunicipiosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MunicipiosRecord.fromSnapshot(s));

  static Future<MunicipiosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MunicipiosRecord.fromSnapshot(s));

  static MunicipiosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MunicipiosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MunicipiosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MunicipiosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MunicipiosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MunicipiosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMunicipiosRecordData({
  String? municipio,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'municipio': municipio,
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class MunicipiosRecordDocumentEquality implements Equality<MunicipiosRecord> {
  const MunicipiosRecordDocumentEquality();

  @override
  bool equals(MunicipiosRecord? e1, MunicipiosRecord? e2) {
    return e1?.municipio == e2?.municipio && e1?.nombre == e2?.nombre;
  }

  @override
  int hash(MunicipiosRecord? e) =>
      const ListEquality().hash([e?.municipio, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is MunicipiosRecord;
}
