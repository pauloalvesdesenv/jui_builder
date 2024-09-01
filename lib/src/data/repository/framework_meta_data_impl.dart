import 'package:jui_builder/src/data/data_source/framework_data_source.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart';

class FrameworkMetaDataRepositoryImpl implements FrameworkMetaDataRepository {
  final FrameworkMetaDataSource _frameworkMetaDataSource;

  FrameworkMetaDataRepositoryImpl(this._frameworkMetaDataSource);

  @override
  Future<FrameworkMetaDataResponseModel> getFrameworkMetaData() async {
    return await _frameworkMetaDataSource.get();
  }
}
