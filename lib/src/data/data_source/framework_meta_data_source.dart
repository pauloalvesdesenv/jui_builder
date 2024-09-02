import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/errors/framework_meta_data_errors.dart';
import 'package:jui_builder/src/domain/services/local_data_service.dart';

abstract class FrameworkMetaDataSource {
  Future<FrameworkMetaDataResponseModel> get();
  Future<void> add(FrameworkMetaDataResponseModel frameworkMetaData);
}

@Injectable(as: FrameworkMetaDataSource)
class FrameworkLocalDataSourceImpl implements FrameworkMetaDataSource {
  final LocalDataSourceService _localDataSourceService;

  FrameworkLocalDataSourceImpl(this._localDataSourceService);

  @override
  Future<FrameworkMetaDataResponseModel> get() async {
    final data = await _localDataSourceService.get('framework_meta_data');
    if (data == null) throw FrameworkMetaDataNotFound();
    return FrameworkMetaDataResponseModel.fromMap(jsonDecode(data));
  }

  @override
  Future<void> add(FrameworkMetaDataResponseModel frameworkMetaData) async {
    await _localDataSourceService.add(
        'framework_meta_data', frameworkMetaData.toJson());
  }
}
