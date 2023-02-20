import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get nume;

  String? get prenume;

  LatLng? get location;

  @BuiltValueField(wireName: 'last_cycle')
  DateTime? get lastCycle;

  @BuiltValueField(wireName: 'cycle_duration')
  int? get cycleDuration;

  @BuiltValueField(wireName: 'location_doc')
  DocumentReference? get locationDoc;

  String? get pin;

  bool? get subscribed;

  @BuiltValueField(wireName: 'subscription_date')
  DateTime? get subscriptionDate;

  @BuiltValueField(wireName: 'owned_meds')
  BuiltList<DocumentReference>? get ownedMeds;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..nume = ''
    ..prenume = ''
    ..cycleDuration = 0
    ..pin = ''
    ..subscribed = false
    ..ownedMeds = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nume,
  String? prenume,
  LatLng? location,
  DateTime? lastCycle,
  int? cycleDuration,
  DocumentReference? locationDoc,
  String? pin,
  bool? subscribed,
  DateTime? subscriptionDate,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..nume = nume
        ..prenume = prenume
        ..location = location
        ..lastCycle = lastCycle
        ..cycleDuration = cycleDuration
        ..locationDoc = locationDoc
        ..pin = pin
        ..subscribed = subscribed
        ..subscriptionDate = subscriptionDate
        ..ownedMeds = null,
    ),
  );

  return firestoreData;
}
