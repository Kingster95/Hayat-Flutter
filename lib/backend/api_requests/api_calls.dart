import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'LOGIN',
      apiUrl: 'https://artadeafifemeie.ro/api/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? fn = '',
    String? ln = '',
    String? phone = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'REGISTER',
      apiUrl: 'https://artadeafifemeie.ro/api/register',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      params: {
        'email': email,
        'fn': fn,
        'ln': ln,
        'phone': phone,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserCoursesCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET USER COURSES',
      apiUrl: 'https://artadeafifemeie.ro/api/my_courses',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer XKIpioquwertlnmadgkljh2m123kmlafgmnasdfkl',
      },
      params: {
        'uid': uid,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].excerpt''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tag''',
        true,
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      );
  static dynamic offer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].offer''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data[:].time''',
        true,
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET CATEGORIES',
      apiUrl: 'https://artadeafifemeie.ro/api/categories',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer XKIpioquwertlnmadgkljh2m123kmlafgmnasdfkl',
      },
      params: {
        'uid': uid,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].excerpt''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tag''',
        true,
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      );
  static dynamic offer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].offer''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data[:].time''',
        true,
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetCategoriesCoursesCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET CATEGORIES COURSES',
      apiUrl: 'https://artadeafifemeie.ro/api/category_courses',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer XKIpioquwertlnmadgkljh2m123kmlafgmnasdfkl',
      },
      params: {
        'id': id,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].excerpt''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tag''',
        true,
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      );
  static dynamic offer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].offer''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data[:].time''',
        true,
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetCoursesLessonsCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET COURSES LESSONS',
      apiUrl: 'https://artadeafifemeie.ro/api/course_lessons',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Connection': 'keep-alive',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer XKIpioquwertlnmadgkljh2m123kmlafgmnasdfkl',
      },
      params: {
        'id': id,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].excerpt''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
  static dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tag''',
        true,
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      );
  static dynamic offer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].offer''',
        true,
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data[:].time''',
        true,
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class DownloadFileCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Download File',
      apiUrl:
          'https://firebasestorage.googleapis.com/v0/b/hayat-371613.appspot.com/o/med%2F2%2Fmeditatia_reconectarea%20la%20puterea%20personala.mp4?alt=media&token=c17d2c07-4dd5-49e7-a64d-659b340f6e74',
      callType: ApiCallType.GET,
      headers: {
        'Content-Disposition': 'attachment',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
