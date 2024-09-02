import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/client/jui_builder_http_client.dart';

abstract class JuiDataSource {
  Future<Map<String, dynamic>> getJson();
}

// @Injectable(as: JuiDataSource)
// class JuiRemoteDataSourceImpl implements JuiDataSource {
//   final JuiBuilderHttpClient client;

//   JuiRemoteDataSourceImpl(this.client);

//   @override
//   Future<Map<String, dynamic>> getJson() async {
//     final response =
//         await client.get('/v3/4a2dcf46-1c9f-4e05-9f8f-baa262d8bc23');
//     return response.data;
//   }
// }

@Injectable(as: JuiDataSource)
class JuiAssetDataSourceImpl implements JuiDataSource {
  final JuiBuilderHttpClient client;

  JuiAssetDataSourceImpl(this.client);

  @override
  Future<Map<String, dynamic>> getJson() async {
    final data =
        await rootBundle.loadString('assets/jsons/json_dynamic_widget.json');
    return jsonDecode(data);
  }
}
