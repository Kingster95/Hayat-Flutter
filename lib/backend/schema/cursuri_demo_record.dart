import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cursuri_demo_record.g.dart';

abstract class CursuriDemoRecord
    implements Built<CursuriDemoRecord, CursuriDemoRecordBuilder> {
  static Serializer<CursuriDemoRecord> get serializer =>
      _$cursuriDemoRecordSerializer;

  String? get title;

  String? get video;

  int? get index;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CursuriDemoRecordBuilder builder) => builder
    ..title = ''
    ..video = ''
    ..index = 0
    ..image = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cursuri_demo')
          : FirebaseFirestore.instance.collectionGroup('cursuri_demo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cursuri_demo').doc();

  static Stream<CursuriDemoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CursuriDemoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CursuriDemoRecord._();
  factory CursuriDemoRecord([void Function(CursuriDemoRecordBuilder) updates]) =
      _$CursuriDemoRecord;

  static CursuriDemoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCursuriDemoRecordData({
  String? title,
  String? video,
  int? index,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    CursuriDemoRecord.serializer,
    CursuriDemoRecord(
      (c) => c
        ..title = title
        ..video = video
        ..index = index
        ..image = image,
    ),
  );

  return firestoreData;
}
