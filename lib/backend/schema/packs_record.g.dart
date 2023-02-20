// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PacksRecord> _$packsRecordSerializer = new _$PacksRecordSerializer();

class _$PacksRecordSerializer implements StructuredSerializer<PacksRecord> {
  @override
  final Iterable<Type> types = const [PacksRecord, _$PacksRecord];
  @override
  final String wireName = 'PacksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PacksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.meds;
    if (value != null) {
      result
        ..add('meds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
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
  PacksRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PacksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'meds':
          result.meds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PacksRecord extends PacksRecord {
  @override
  final int? price;
  @override
  final BuiltList<DocumentReference<Object?>>? meds;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PacksRecord([void Function(PacksRecordBuilder)? updates]) =>
      (new PacksRecordBuilder()..update(updates))._build();

  _$PacksRecord._(
      {this.price, this.meds, this.name, this.description, this.ffRef})
      : super._();

  @override
  PacksRecord rebuild(void Function(PacksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PacksRecordBuilder toBuilder() => new PacksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PacksRecord &&
        price == other.price &&
        meds == other.meds &&
        name == other.name &&
        description == other.description &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, price.hashCode), meds.hashCode), name.hashCode),
            description.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PacksRecord')
          ..add('price', price)
          ..add('meds', meds)
          ..add('name', name)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PacksRecordBuilder implements Builder<PacksRecord, PacksRecordBuilder> {
  _$PacksRecord? _$v;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  ListBuilder<DocumentReference<Object?>>? _meds;
  ListBuilder<DocumentReference<Object?>> get meds =>
      _$this._meds ??= new ListBuilder<DocumentReference<Object?>>();
  set meds(ListBuilder<DocumentReference<Object?>>? meds) =>
      _$this._meds = meds;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PacksRecordBuilder() {
    PacksRecord._initializeBuilder(this);
  }

  PacksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _meds = $v.meds?.toBuilder();
      _name = $v.name;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PacksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PacksRecord;
  }

  @override
  void update(void Function(PacksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PacksRecord build() => _build();

  _$PacksRecord _build() {
    _$PacksRecord _$result;
    try {
      _$result = _$v ??
          new _$PacksRecord._(
              price: price,
              meds: _meds?.build(),
              name: name,
              description: description,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meds';
        _meds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PacksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
