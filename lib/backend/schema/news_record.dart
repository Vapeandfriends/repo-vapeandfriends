import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  bool hasFecha() => _fecha != null;

  // "Texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  void _initializeFields() {
    _categoria = snapshotData['Categoria'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
    _titulo = snapshotData['Titulo'] as String?;
    _fecha = snapshotData['Fecha'] as String?;
    _texto = snapshotData['Texto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('News');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? categoria,
  String? imagen,
  String? titulo,
  String? fecha,
  String? texto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Categoria': categoria,
      'Imagen': imagen,
      'Titulo': titulo,
      'Fecha': fecha,
      'Texto': texto,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.categoria == e2?.categoria &&
        e1?.imagen == e2?.imagen &&
        e1?.titulo == e2?.titulo &&
        e1?.fecha == e2?.fecha &&
        e1?.texto == e2?.texto;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality()
      .hash([e?.categoria, e?.imagen, e?.titulo, e?.fecha, e?.texto]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
