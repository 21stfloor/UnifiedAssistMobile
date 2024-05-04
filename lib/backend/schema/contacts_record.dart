import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ContactsRecord extends FirestoreRecord {
  ContactsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _fullName = snapshotData['full_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Contacts');

  static Stream<ContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactsRecord.fromSnapshot(s));

  static Future<ContactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactsRecord.fromSnapshot(s));

  static ContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactsRecordData({
  String? fullName,
  String? phoneNumber,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'full_name': fullName,
      'phone_number': phoneNumber,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactsRecordDocumentEquality implements Equality<ContactsRecord> {
  const ContactsRecordDocumentEquality();

  @override
  bool equals(ContactsRecord? e1, ContactsRecord? e2) {
    return e1?.fullName == e2?.fullName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(ContactsRecord? e) =>
      const ListEquality().hash([e?.fullName, e?.phoneNumber, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is ContactsRecord;
}
