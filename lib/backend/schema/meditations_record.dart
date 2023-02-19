import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meditations_record.g.dart';

abstract class MeditationsRecord
    implements Built<MeditationsRecord, MeditationsRecordBuilder> {
  static Serializer<MeditationsRecord> get serializer =>
      _$meditationsRecordSerializer;

  String? get name;

  String? get description;

  String? get price;

  String? get image;

  String? get video;

  bool? get deployed;

  int? get index;

  @BuiltValueField(wireName: 'video_link')
  String? get videoLink;

  bool? get isAudio;

  String? get mp3;

  DocumentReference? get pack;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MeditationsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..price = ''
    ..image = ''
    ..video = ''
    ..deployed = false
    ..index = 0
    ..videoLink = ''
    ..isAudio = false
    ..mp3 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditations');

  static Stream<MeditationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MeditationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MeditationsRecord._();
  factory MeditationsRecord([void Function(MeditationsRecordBuilder) updates]) =
      _$MeditationsRecord;

  static MeditationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMeditationsRecordData({
  String? name,
  String? description,
  String? price,
  String? image,
  String? video,
  bool? deployed,
  int? index,
  String? videoLink,
  bool? isAudio,
  String? mp3,
  DocumentReference? pack,
}) {
  final firestoreData = serializers.toFirestore(
    MeditationsRecord.serializer,
    MeditationsRecord(
      (m) => m
        ..name = name
        ..description = description
        ..price = price
        ..image = image
        ..video = video
        ..deployed = deployed
        ..index = index
        ..videoLink = videoLink
        ..isAudio = isAudio
        ..mp3 = mp3
        ..pack = pack,
    ),
  );

  return firestoreData;
}
