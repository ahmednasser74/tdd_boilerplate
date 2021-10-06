import 'package:get/get.dart';

class DefaultGetConnect extends GetConnect {
  final Map<String, String>? headers;

  DefaultGetConnect({this.headers = const {'localization': 'en'}});

  @override
  InternalFinalCallback<void> get onStart {
    super.onStart;
    httpClient.baseUrl = 'https://morgan.toast.sa/api/';
    return InternalFinalCallback<void>();
  }

  Future<Response> getDataById(String path, int id) async {
    final response = await httpClient.get(
      '$path/$id',
      headers: headers,
    );
    return response;
  }

  Future<Response> getData({required String path}) async {
    final response = await httpClient.get(
      '$path',
      headers: headers,
    );
    return response;
  }

  Future<Response> postData(String path, {Map<String, dynamic>? data}) async {
    final response = await httpClient.post(
      '$path',
      query: data,
      headers: headers,
    );
    return response;
  }

  Future<Response> putData(String path, {Map<String, dynamic>? data}) async {
    final response = await httpClient.put(
      '$path',
      query: data,
      headers: headers,
    );
    return response;
  }

  @override
  void onClose() {
    httpClient.close();
    super.onClose();
  }
}
