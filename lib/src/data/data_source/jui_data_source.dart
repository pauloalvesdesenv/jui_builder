import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';
import 'package:jui_builder/src/data/client/jui_builder_http_client.dart';

abstract class JuiDataSource {
  Future<dynamic> getJson();
}

@Injectable(as: JuiDataSource)
class JuiRemoteDataSourceImpl implements JuiDataSource {
  final JuiBuilderHttpClient client;

  JuiRemoteDataSourceImpl(this.client);

  @override
  Future<dynamic> getJson() async {
    final response = await client
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
