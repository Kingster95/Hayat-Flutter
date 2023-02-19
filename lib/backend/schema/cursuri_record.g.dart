// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursuri_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CursuriRecord> _$cursuriRecordSerializer =
    new _$CursuriRecordSerializer();

class _$CursuriRecordSerializer implements StructuredSerializer<CursuriRecord> {
  @override
  final Iterable<Type> types = const [CursuriRecord, _$CursuriRecord];
  @override
  final String wireName = 'CursuriRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CursuriRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  CursuriRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CursuriRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$CursuriRecord extends CursuriRecord {
  @override
  final String? title;
  @override
  final String? video;
  @override
  final int? index;
  @override
  final String? image;
  @override
  final int? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CursuriRecord([void Function(CursuriRecordBuilder)? updates]) =>
      (new CursuriRecordBuilder()..update(updates))._build();

  _$CursuriRecord._(
      {this.title,
      this.video,
      this.index,
      this.image,
      this.category,
      this.ffRef})
      : super._();

  @override
  CursuriRecord rebuild(void Function(CursuriRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CursuriRecordBuilder toBuilder() => new CursuriRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CursuriRecord &&
        title == other.title &&
        video == other.video &&
        index == other.index &&
        image == other.image &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), video.hashCode),
                    index.hashCode),
                image.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CursuriRecord')
          ..add('title', title)
          ..add('video', video)
          ..add('index', index)
          ..add('image', image)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CursuriRecordBuilder
    implements Builder<CursuriRecord, CursuriRecordBuilder> {
  _$CursuriRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _category;
  int? get category => _$this._category;
  set category(int? category) => _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CursuriRecordBuilder() {
    CursuriRecord._initializeBuilder(this);
  }

  CursuriRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _video = $v.video;
      _index = $v.index;
      _image = $v.image;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CursuriRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CursuriRecord;
  }

  @override
  void update(void Function(CursuriRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CursuriRecord build() => _build();

  _$CursuriRecord _build() {
    final _$result = _$v ??
        new _$CursuriRecord._(
            title: title,
            video: video,
            index: index,
            image: image,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
