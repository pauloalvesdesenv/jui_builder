import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';

abstract class JuiDataSource {
  Future<dynamic> getJson();
}

@Injectable(as: JuiDataSource)
class JuiRemoteDataSourceImpl implements JuiDataSource {
  final Dio _dio;

  JuiRemoteDataSourceImpl(this._dio);

  @override
  Future<dynamic> getJson() async {
    final response = await _dio
        .get('https://run.mocky.io/v3/01d52428-ea65-4343-bfab-d432f6ca0a6c');
    return response.data;
  }
}

// @Injectable(as: JuiDataSource)
// class JuiLocalDataSourceImpl implements JuiDataSource {
//   JuiLocalDataSourceImpl();

//   final String _localJson = '''''';

//   @override
//   Future<dynamic> getJson() async {
//     return jsonDecode(_localJson);
//     Map<String, dynamic> json = {"args": {}};
//     Map<String, dynamic> jsonui = jsonDecode(_localJson);
//     for (var key in jsonui.keys) {
//       if (key == '\$comp') {
//         json['type'] = jsonui['\$comp'];
//       }
//       if (key != '\$comp') {
//         json['args'].addAll({key.replaceFirst('\$', ''): jsonui[key]});
//       }
//     }
//   }
// }
