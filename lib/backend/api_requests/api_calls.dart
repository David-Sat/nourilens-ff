import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FastAPIGemini Group Code

class FastAPIGeminiGroup {
  static String baseUrl = 'https://nourilens-414117.ue.r.appspot.com/';
  static Map<String, String> headers = {};
  static GetMockItemsMockItemsGetCall getMockItemsMockItemsGetCall =
      GetMockItemsMockItemsGetCall();
  static UploadImageUploadPostCall uploadImageUploadPostCall =
      UploadImageUploadPostCall();
  static TestPostTestPostCall testPostTestPostCall = TestPostTestPostCall();
  static SuggestionsCall suggestionsCall = SuggestionsCall();
}

class GetMockItemsMockItemsGetCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_mock_items_mock_items_get',
      apiUrl: '${FastAPIGeminiGroup.baseUrl}/mock-items',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<double>? prices(dynamic response) => (getJsonField(
        response,
        r'''$[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? nutriValue(dynamic response) => (getJsonField(
        response,
        r'''$[:].nutritionalValue''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UploadImageUploadPostCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'upload_image_upload_post',
      apiUrl: '${FastAPIGeminiGroup.baseUrl}/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TestPostTestPostCall {
  Future<ApiCallResponse> call({
    String? items = 'test',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'test_post_test_post',
      apiUrl: '${FastAPIGeminiGroup.baseUrl}/test',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'items_string': items,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SuggestionsCall {
  Future<ApiCallResponse> call({
    String? itemsString = 'test',
  }) async {
    final ffApiRequestBody = '''
{"items_string": "$itemsString"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'suggestions',
      apiUrl: '${FastAPIGeminiGroup.baseUrl}suggestions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FastAPIGemini Group Code

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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
