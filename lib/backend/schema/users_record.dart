import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userCity" field.
  String? _userCity;
  String get userCity => _userCity ?? '';
  bool hasUserCity() => _userCity != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "primerInicio" field.
  bool? _primerInicio;
  bool get primerInicio => _primerInicio ?? false;
  bool hasPrimerInicio() => _primerInicio != null;

  // "display_lastname" field.
  String? _displayLastname;
  String get displayLastname => _displayLastname ?? '';
  bool hasDisplayLastname() => _displayLastname != null;

  // "userDepartamento" field.
  String? _userDepartamento;
  String get userDepartamento => _userDepartamento ?? '';
  bool hasUserDepartamento() => _userDepartamento != null;

  // "userDireccion" field.
  String? _userDireccion;
  String get userDireccion => _userDireccion ?? '';
  bool hasUserDireccion() => _userDireccion != null;

  // "orderList" field.
  List<DocumentReference>? _orderList;
  List<DocumentReference> get orderList => _orderList ?? const [];
  bool hasOrderList() => _orderList != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "numDocumento" field.
  int? _numDocumento;
  int get numDocumento => _numDocumento ?? 0;
  bool hasNumDocumento() => _numDocumento != null;

  // "tipoDocumento" field.
  List<String>? _tipoDocumento;
  List<String> get tipoDocumento => _tipoDocumento ?? const [];
  bool hasTipoDocumento() => _tipoDocumento != null;

  void _initializeFields() {
    _userCity = snapshotData['userCity'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _primerInicio = snapshotData['primerInicio'] as bool?;
    _displayLastname = snapshotData['display_lastname'] as String?;
    _userDepartamento = snapshotData['userDepartamento'] as String?;
    _userDireccion = snapshotData['userDireccion'] as String?;
    _orderList = getDataList(snapshotData['orderList']);
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _numDocumento = castToType<int>(snapshotData['numDocumento']);
    _tipoDocumento = getDataList(snapshotData['tipoDocumento']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? userCity,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  bool? primerInicio,
  String? displayLastname,
  String? userDepartamento,
  String? userDireccion,
  bool? isAdmin,
  int? numDocumento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userCity': userCity,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'bio': bio,
      'primerInicio': primerInicio,
      'display_lastname': displayLastname,
      'userDepartamento': userDepartamento,
      'userDireccion': userDireccion,
      'isAdmin': isAdmin,
      'numDocumento': numDocumento,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userCity == e2?.userCity &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.primerInicio == e2?.primerInicio &&
        e1?.displayLastname == e2?.displayLastname &&
        e1?.userDepartamento == e2?.userDepartamento &&
        e1?.userDireccion == e2?.userDireccion &&
        listEquality.equals(e1?.orderList, e2?.orderList) &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.numDocumento == e2?.numDocumento &&
        listEquality.equals(e1?.tipoDocumento, e2?.tipoDocumento);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.userCity,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.bio,
        e?.primerInicio,
        e?.displayLastname,
        e?.userDepartamento,
        e?.userDireccion,
        e?.orderList,
        e?.isAdmin,
        e?.numDocumento,
        e?.tipoDocumento
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
