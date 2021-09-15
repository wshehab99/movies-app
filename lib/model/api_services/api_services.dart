import 'package:api_task/model/data/api.dart';
import 'package:api_task/model/data/constatnts.dart';

import 'package:dio/dio.dart';

import '../PageBAseRespons.dart';

class ApiSrevices {
  static ApiSrevices? _apiSrevices;
  ApiSrevices.instance();
  factory ApiSrevices() {
    if (_apiSrevices == null) _apiSrevices = ApiSrevices.instance();
    return _apiSrevices!;
  }
  static Future<List<Result>> getPage() async {
    String url = '$baseUrl/3/movie/popular?api_key=$key';
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data['results']
          .map<Result>((e) => Result.fromJSON(e))
          .toList();
    } else {
      throw 'error';
    }
  }
}
