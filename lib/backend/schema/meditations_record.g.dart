// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MeditationsRecord> _$meditationsRecordSerializer =
    new _$MeditationsRecordSerializer();

class _$MeditationsRecordSerializer
    implements StructuredSerializer<MeditationsRecord> {
  @override
  final Iterable<Type> types = const [MeditationsRecord, _$MeditationsRecord];
  @override
  final String wireName = 'MeditationsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MeditationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deployed;
    if (value != null) {
      result
        ..add('deployed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoLink;
    if (value != null) {
      result
        ..add('video_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isAudio;
    if (value != null) {
      result
        ..add('isAudio')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.mp3;
    if (value != null) {
      result
        ..add('mp3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pack;
    if (value != null) {
      result
        ..add('pack')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MeditationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MeditationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deployed':
          result.deployed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isAudio':
          result.isAudio = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'mp3':
          result.mp3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pack':
          result.pack = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MeditationsRecord extends MeditationsRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? price;
  @override
  final String? image;
  @override
  final String? video;
  @override
  final bool? deployed;
  @override
  final int? index;
  @override
  final String? videoLink;
  @override
  final bool? isAudio;
  @override
  final String? mp3;
  @override
  final DocumentReference<Object?>? pack;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MeditationsRecord(
          [void Function(MeditationsRecordBuilder)? updates]) =>
      (new MeditationsRecordBuilder()..update(updates))._build();

  _$MeditationsRecord._(
      {this.name,
      this.description,
      this.price,
      this.image,
      this.video,
      this.deployed,
      this.index,
      this.videoLink,
      this.isAudio,
      this.mp3,
      this.pack,
      this.ffRef})
      : super._();

  @override
  MeditationsRecord rebuild(void Function(MeditationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeditationsRecordBuilder toBuilder() =>
      new MeditationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeditationsRecord &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        image == other.image &&
        video == other.video &&
        deployed == other.deployed &&
        index == other.index &&
        videoLink == other.videoLink &&
        isAudio == other.isAudio &&
        mp3 == other.mp3 &&
        pack == other.pack &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                description.hashCode),
                                            price.hashCode),
                                        image.hashCode),
                                    video.hashCode),
                                deployed.hashCode),
                            index.hashCode),
                        videoLink.hashCode),
                    isAudio.hashCode),
                mp3.hashCode),
            pack.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeditationsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('image', image)
          ..add('video', video)
          ..add('deployed', deployed)
          ..add('index', index)
          ..add('videoLink', videoLink)
          ..add('isAudio', isAudio)
          ..add('mp3', mp3)
          ..add('pack', pack)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MeditationsRecordBuilder
    implements Builder<MeditationsRecord, MeditationsRecordBuilder> {
  _$MeditationsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  bool? _deployed;
  bool? get deployed => _$this._deployed;
  set deployed(bool? deployed) => _$this._deployed = deployed;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _videoLink;
  String? get videoLink => _$this._videoLink;
  set videoLink(String? videoLink) => _$this._videoLink = videoLink;

  bool? _isAudio;
  bool? get isAudio => _$this._isAudio;
  set isAudio(bool? isAudio) => _$this._isAudio = isAudio;

  String? _mp3;
  String? get mp3 => _$this._mp3;
  set mp3(String? mp3) => _$this._mp3 = mp3;

  DocumentReference<Object?>? _pack;
  DocumentReference<Object?>? get pack => _$this._pack;
  set pack(DocumentReference<Object?>? pack) => _$this._pack = pack;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MeditationsRecordBuilder() {
    MeditationsRecord._initializeBuilder(this);
  }

  MeditationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _price = $v.price;
      _image = $v.image;
      _video = $v.video;
      _deployed = $v.deployed;
      _index = $v.index;
      _videoLink = $v.videoLink;
      _isAudio = $v.isAudio;
      _mp3 = $v.mp3;
      _pack = $v.pack;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeditationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeditationsRecord;
  }

  @override
  void update(void Function(MeditationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeditationsRecord build() => _build();

  _$MeditationsRecord _build() {
    final _$result = _$v ??
        new _$MeditationsRecord._(
            name: name,
            description: description,
            price: price,
            image: image,
            video: video,
            deployed: deployed,
            index: index,
            videoLink: videoLink,
            isAudio: isAudio,
            mp3: mp3,
            pack: pack,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
