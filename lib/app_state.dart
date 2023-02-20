import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _pinCode = await secureStorage.getString('ff_pinCode') ?? _pinCode;
    _keepLoggedIn =
        await secureStorage.getBool('ff_keepLoggedIn') ?? _keepLoggedIn;
    _ID = await secureStorage.getString('ff_ID') ?? _ID;
    _lastQuote = await secureStorage.getString('ff_lastQuote') ?? _lastQuote;
    _lastDateQuote = await secureStorage.read(key: 'ff_lastDateQuote') != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (await secureStorage.getInt('ff_lastDateQuote'))!)
        : null;
    _lastChallengeDate =
        await secureStorage.read(key: 'ff_lastChallengeDate') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (await secureStorage.getInt('ff_lastChallengeDate'))!)
            : null;
    _lastChallenge =
        await secureStorage.getString('ff_lastChallenge') ?? _lastChallenge;
    _packMeds = (await secureStorage.getStringList('ff_packMeds'))
            ?.map((path) => path.ref)
            .toList() ??
        _packMeds;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _pinCode = '';
  String get pinCode => _pinCode;
  set pinCode(String _value) {
    _pinCode = _value;
    secureStorage.setString('ff_pinCode', _value);
  }

  void deletePinCode() {
    secureStorage.delete(key: 'ff_pinCode');
  }

  bool _keepLoggedIn = false;
  bool get keepLoggedIn => _keepLoggedIn;
  set keepLoggedIn(bool _value) {
    _keepLoggedIn = _value;
    secureStorage.setBool('ff_keepLoggedIn', _value);
  }

  void deleteKeepLoggedIn() {
    secureStorage.delete(key: 'ff_keepLoggedIn');
  }

  bool _pinEntered = false;
  bool get pinEntered => _pinEntered;
  set pinEntered(bool _value) {
    _pinEntered = _value;
  }

  bool _freshStart = true;
  bool get freshStart => _freshStart;
  set freshStart(bool _value) {
    _freshStart = _value;
  }

  String _ID = '';
  String get ID => _ID;
  set ID(String _value) {
    _ID = _value;
    secureStorage.setString('ff_ID', _value);
  }

  void deleteID() {
    secureStorage.delete(key: 'ff_ID');
  }

  String _lastQuote = 'Quote';
  String get lastQuote => _lastQuote;
  set lastQuote(String _value) {
    _lastQuote = _value;
    secureStorage.setString('ff_lastQuote', _value);
  }

  void deleteLastQuote() {
    secureStorage.delete(key: 'ff_lastQuote');
  }

  DateTime? _lastDateQuote = DateTime.fromMillisecondsSinceEpoch(1672524660000);
  DateTime? get lastDateQuote => _lastDateQuote;
  set lastDateQuote(DateTime? _value) {
    _lastDateQuote = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_lastDateQuote', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastDateQuote');
  }

  void deleteLastDateQuote() {
    secureStorage.delete(key: 'ff_lastDateQuote');
  }

  DateTime? _lastChallengeDate =
      DateTime.fromMillisecondsSinceEpoch(1672526160000);
  DateTime? get lastChallengeDate => _lastChallengeDate;
  set lastChallengeDate(DateTime? _value) {
    _lastChallengeDate = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_lastChallengeDate', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastChallengeDate');
  }

  void deleteLastChallengeDate() {
    secureStorage.delete(key: 'ff_lastChallengeDate');
  }

  String _lastChallenge = 'Challenge';
  String get lastChallenge => _lastChallenge;
  set lastChallenge(String _value) {
    _lastChallenge = _value;
    secureStorage.setString('ff_lastChallenge', _value);
  }

  void deleteLastChallenge() {
    secureStorage.delete(key: 'ff_lastChallenge');
  }

  List<DocumentReference> _packMeds = [
    FirebaseFirestore.instance.doc('/meditations/ZYTvUcjmsFnlP3dk5PMQ'),
    FirebaseFirestore.instance.doc('/meditations/jNFmMCaPmxEvIxnakpXQ'),
    FirebaseFirestore.instance.doc('/meditations/OtSRPDk9yozuxIEe03QG'),
    FirebaseFirestore.instance.doc('/meditations/F9IWRuo1GtSjzhhE1Jth'),
    FirebaseFirestore.instance.doc('/meditations/RR0X7CgNZTh3teoXAUP0'),
    FirebaseFirestore.instance.doc('/meditations/qH5q4rT2daAudYpxUjkC'),
    FirebaseFirestore.instance.doc('/meditations/vAoKJXanNyK3XQoRSMJ6'),
    FirebaseFirestore.instance.doc('/meditations/xPMRLFmx74braTyCYnIv'),
    FirebaseFirestore.instance.doc('/meditations/TF55DTQqbS2QIVpfMoAK'),
    FirebaseFirestore.instance.doc('/meditations/0zW1Vfmy4NqpJxC73leB'),
    FirebaseFirestore.instance.doc('/meditations/NpzrWmitqLh9jlbWsBBN')
  ];
  List<DocumentReference> get packMeds => _packMeds;
  set packMeds(List<DocumentReference> _value) {
    _packMeds = _value;
    secureStorage.setStringList(
        'ff_packMeds', _value.map((x) => x.path).toList());
  }

  void deletePackMeds() {
    secureStorage.delete(key: 'ff_packMeds');
  }

  void addToPackMeds(DocumentReference _value) {
    _packMeds.add(_value);
    secureStorage.setStringList(
        'ff_packMeds', _packMeds.map((x) => x.path).toList());
  }

  void removeFromPackMeds(DocumentReference _value) {
    _packMeds.remove(_value);
    secureStorage.setStringList(
        'ff_packMeds', _packMeds.map((x) => x.path).toList());
  }

  void removeAtIndexFromPackMeds(int _index) {
    _packMeds.removeAt(_index);
    secureStorage.setStringList(
        'ff_packMeds', _packMeds.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
