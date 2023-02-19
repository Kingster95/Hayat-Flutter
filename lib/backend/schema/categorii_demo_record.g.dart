// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorii_demo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriiDemoRecord> _$categoriiDemoRecordSerializer =
    new _$CategoriiDemoRecordSerializer();

class _$CategoriiDemoRecordSerializer
    implements StructuredSerializer<CategoriiDemoRecord> {
  @override
  final Iterable<Type> types = const [
    CategoriiDemoRecord,
    _$CategoriiDemoRecord
  ];
  @override
  final String wireName = 'CategoriiDemoRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CategoriiDemoRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
  CategoriiDemoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriiDemoRecordBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
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

class _$CategoriiDemoRecord extends CategoriiDemoRecord {
  @override
  final String? name;
  @override
  final String? image;
  @override
  final int? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoriiDemoRecord(
          [void Function(CategoriiDemoRecordBuilder)? updates]) =>
      (new CategoriiDemoRecordBuilder()..update(updates))._build();

  _$CategoriiDemoRecord._({this.name, this.image, this.id, this.ffRef})
      : super._();

  @override
  CategoriiDemoRecord rebuild(
          void Function(CategoriiDemoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriiDemoRecordBuilder toBuilder() =>
      new CategoriiDemoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriiDemoRecord &&
        name == other.name &&
        image == other.image &&
        id == other.id &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, name.hashCode), image.hashCode), id.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriiDemoRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoriiDemoRecordBuilder
    implements Builder<CategoriiDemoRecord, CategoriiDemoRecordBuilder> {
  _$CategoriiDemoRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoriiDemoRecordBuilder() {
    CategoriiDemoRecord._initializeBuilder(this);
  }

  CategoriiDemoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriiDemoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriiDemoRecord;
  }

  @override
  void update(void Function(CategoriiDemoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriiDemoRecord build() => _build();

  _$CategoriiDemoRecord _build() {
    final _$result = _$v ??
        new _$CategoriiDemoRecord._(
            name: name, image: image, id: id, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
