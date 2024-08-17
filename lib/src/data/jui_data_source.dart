import 'dart:convert';

import 'package:injectable/injectable.dart';

// import 'package:dio/dio.dart';

abstract class JuiDataSource {
  Future<Map<String, dynamic>> getJson();
}

// class JuiRemoteDataSourceImpl implements JuiDataSource {
//   final Dio _dio;

//   JuiRemoteDataSourceImpl(this._dio);

//   @override
//   Future<Map<String, dynamic>> getJson() {
//     throw UnimplementedError();
//   }
// }

@Injectable(as: JuiDataSource)
class JuiLocalDataSourceImpl implements JuiDataSource {
  JuiLocalDataSourceImpl();

  final String _localJson = '''{
          "\$comp": "Text",
          "\$children": "Hello World",
          "style": {"textAlign": "center", "fontSize": 60}
        }''';

  @override
  Future<Map<String, dynamic>> getJson() async {
    Map<String, dynamic> json = {"args": {}};
    Map<String, dynamic> jsonui = jsonDecode(_localJson);
    for (var key in jsonui.keys) {
      if (key == '\$comp') {
        json['type'] = jsonui['\$comp'];
      }
      if (key != '\$comp') {
        json['args'].addAll({key.replaceFirst('\$', ''): jsonui[key]});
      }
    }

    return json;
  }
}
