import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'categorii_demo_record.g.dart';

abstract class CategoriiDemoRecord
    implements Built<CategoriiDemoRecord, CategoriiDemoRecordBuilder> {
  static Serializer<CategoriiDemoRecord> get serializer =>
      _$categoriiDemoRecordSerializer;

  String? get name;

  String? get image;

  int? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoriiDemoRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..id = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoriiDemo');

  static Stream<CategoriiDemoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoriiDemoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoriiDemoRecord._();
  factory CategoriiDemoRecord(
          [void Function(CategoriiDemoRecordBuilder) updates]) =
      _$CategoriiDemoRecord;

  static CategoriiDemoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoriiDemoRecordData({
  String? name,
  String? image,
  int? id,
}) {
  final firestoreData = serializers.toFirestore(
    CategoriiDemoRecord.serializer,
    CategoriiDemoRecord(
      (c) => c
        ..name = name
        ..image = image
        ..id = id,
    ),
  );

  return firestoreData;
}
