import 'dart:convert';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/errors/framework_meta_data_errors.dart';
import 'package:jui_builder/src/domain/services/local_data_service.dart';

abstract class FrameworkMetaDataSource {
  Future<FrameworkMetaDataResponseModel> get();
}

class FrameworkLocalDataSourceImpl implements FrameworkMetaDataSource {
  final LocalDataSourceService _localDataSourceService;

  FrameworkLocalDataSourceImpl(this._localDataSourceService);

  @override
  Future<FrameworkMetaDataResponseModel> get() async {
    final data = await _localDataSourceService.get('framework_meta_data');
    if (data == null) throw FrameworkMetaDataNotFound();
    return FrameworkMetaDataResponseModel.fromMap(jsonDecode(data));
  }
}
