import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cursuri_record.g.dart';

abstract class CursuriRecord
    implements Built<CursuriRecord, CursuriRecordBuilder> {
  static Serializer<CursuriRecord> get serializer => _$cursuriRecordSerializer;

  String? get title;

  String? get video;

  int? get index;

  String? get image;

  int? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CursuriRecordBuilder builder) => builder
    ..title = ''
    ..video = ''
    ..index = 0
    ..image = ''
    ..category = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cursuri');

  static Stream<CursuriRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CursuriRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CursuriRecord._();
  factory CursuriRecord([void Function(CursuriRecordBuilder) updates]) =
      _$CursuriRecord;

  static CursuriRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCursuriRecordData({
  String? title,
  String? video,
  int? index,
  String? image,
  int? category,
}) {
  final firestoreData = serializers.toFirestore(
    CursuriRecord.serializer,
    CursuriRecord(
      (c) => c
        ..title = title
        ..video = video
        ..index = index
        ..image = image
        ..category = category,
    ),
  );

  return firestoreData;
}
