import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'packs_record.g.dart';

abstract class PacksRecord implements Built<PacksRecord, PacksRecordBuilder> {
  static Serializer<PacksRecord> get serializer => _$packsRecordSerializer;

  int? get price;

  BuiltList<DocumentReference>? get meds;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PacksRecordBuilder builder) => builder
    ..price = 0
    ..meds = ListBuilder()
    ..name = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('packs');

  static Stream<PacksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PacksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PacksRecord._();
  factory PacksRecord([void Function(PacksRecordBuilder) updates]) =
      _$PacksRecord;

  static PacksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPacksRecordData({
  int? price,
  String? name,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    PacksRecord.serializer,
    PacksRecord(
      (p) => p
        ..price = price
        ..meds = null
        ..name = name
        ..description = description,
    ),
  );

  return firestoreData;
}
