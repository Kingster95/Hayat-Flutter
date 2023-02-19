// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nume;
    if (value != null) {
      result
        ..add('nume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prenume;
    if (value != null) {
      result
        ..add('prenume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.lastCycle;
    if (value != null) {
      result
        ..add('last_cycle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cycleDuration;
    if (value != null) {
      result
        ..add('cycle_duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.locationDoc;
    if (value != null) {
      result
        ..add('location_doc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.pin;
    if (value != null) {
      result
        ..add('pin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subscribed;
    if (value != null) {
      result
        ..add('subscribed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.subscriptionDate;
    if (value != null) {
      result
        ..add('subscription_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ownedMeds;
    if (value != null) {
      result
        ..add('owned_meds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nume':
          result.nume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prenume':
          result.prenume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'last_cycle':
          result.lastCycle = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'cycle_duration':
          result.cycleDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'location_doc':
          result.locationDoc = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'pin':
          result.pin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subscribed':
          result.subscribed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'subscription_date':
          result.subscriptionDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'owned_meds':
          result.ownedMeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? nume;
  @override
  final String? prenume;
  @override
  final LatLng? location;
  @override
  final DateTime? lastCycle;
  @override
  final int? cycleDuration;
  @override
  final DocumentReference<Object?>? locationDoc;
  @override
  final String? pin;
  @override
  final bool? subscribed;
  @override
  final DateTime? subscriptionDate;
  @override
  final BuiltList<DocumentReference<Object?>>? ownedMeds;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.nume,
      this.prenume,
      this.location,
      this.lastCycle,
      this.cycleDuration,
      this.locationDoc,
      this.pin,
      this.subscribed,
      this.subscriptionDate,
      this.ownedMeds,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        nume == other.nume &&
        prenume == other.prenume &&
        location == other.location &&
        lastCycle == other.lastCycle &&
        cycleDuration == other.cycleDuration &&
        locationDoc == other.locationDoc &&
        pin == other.pin &&
        subscribed == other.subscribed &&
        subscriptionDate == other.subscriptionDate &&
        ownedMeds == other.ownedMeds &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        email
                                                                            .hashCode),
                                                                    displayName
                                                                        .hashCode),
                                                                photoUrl
                                                                    .hashCode),
                                                            uid.hashCode),
                                                        createdTime.hashCode),
                                                    phoneNumber.hashCode),
                                                nume.hashCode),
                                            prenume.hashCode),
                                        location.hashCode),
                                    lastCycle.hashCode),
                                cycleDuration.hashCode),
                            locationDoc.hashCode),
                        pin.hashCode),
                    subscribed.hashCode),
                subscriptionDate.hashCode),
            ownedMeds.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('nume', nume)
          ..add('prenume', prenume)
          ..add('location', location)
          ..add('lastCycle', lastCycle)
          ..add('cycleDuration', cycleDuration)
          ..add('locationDoc', locationDoc)
          ..add('pin', pin)
          ..add('subscribed', subscribed)
          ..add('subscriptionDate', subscriptionDate)
          ..add('ownedMeds', ownedMeds)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _nume;
  String? get nume => _$this._nume;
  set nume(String? nume) => _$this._nume = nume;

  String? _prenume;
  String? get prenume => _$this._prenume;
  set prenume(String? prenume) => _$this._prenume = prenume;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DateTime? _lastCycle;
  DateTime? get lastCycle => _$this._lastCycle;
  set lastCycle(DateTime? lastCycle) => _$this._lastCycle = lastCycle;

  int? _cycleDuration;
  int? get cycleDuration => _$this._cycleDuration;
  set cycleDuration(int? cycleDuration) =>
      _$this._cycleDuration = cycleDuration;

  DocumentReference<Object?>? _locationDoc;
  DocumentReference<Object?>? get locationDoc => _$this._locationDoc;
  set locationDoc(DocumentReference<Object?>? locationDoc) =>
      _$this._locationDoc = locationDoc;

  String? _pin;
  String? get pin => _$this._pin;
  set pin(String? pin) => _$this._pin = pin;

  bool? _subscribed;
  bool? get subscribed => _$this._subscribed;
  set subscribed(bool? subscribed) => _$this._subscribed = subscribed;

  DateTime? _subscriptionDate;
  DateTime? get subscriptionDate => _$this._subscriptionDate;
  set subscriptionDate(DateTime? subscriptionDate) =>
      _$this._subscriptionDate = subscriptionDate;

  ListBuilder<DocumentReference<Object?>>? _ownedMeds;
  ListBuilder<DocumentReference<Object?>> get ownedMeds =>
      _$this._ownedMeds ??= new ListBuilder<DocumentReference<Object?>>();
  set ownedMeds(ListBuilder<DocumentReference<Object?>>? ownedMeds) =>
      _$this._ownedMeds = ownedMeds;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _nume = $v.nume;
      _prenume = $v.prenume;
      _location = $v.location;
      _lastCycle = $v.lastCycle;
      _cycleDuration = $v.cycleDuration;
      _locationDoc = $v.locationDoc;
      _pin = $v.pin;
      _subscribed = $v.subscribed;
      _subscriptionDate = $v.subscriptionDate;
      _ownedMeds = $v.ownedMeds?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              nume: nume,
              prenume: prenume,
              location: location,
              lastCycle: lastCycle,
              cycleDuration: cycleDuration,
              locationDoc: locationDoc,
              pin: pin,
              subscribed: subscribed,
              subscriptionDate: subscriptionDate,
              ownedMeds: _ownedMeds?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ownedMeds';
        _ownedMeds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
