import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/data_source/framework_meta_data_source.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart';

@Injectable(as: FrameworkMetaDataRepository)
class FrameworkMetaDataRepositoryImpl implements FrameworkMetaDataRepository {
  final FrameworkMetaDataSource _frameworkMetaDataSource;

  FrameworkMetaDataRepositoryImpl(this._frameworkMetaDataSource);

  @override
  Future<FrameworkMetaDataResponseModel> getFrameworkMetaData() async {
    return await _frameworkMetaDataSource.get();
  }

  @override
  Future<void> addFrameworkMetaData(
      FrameworkMetaDataResponseModel frameworkMetaData) async {
    await _frameworkMetaDataSource.add(frameworkMetaData);
  }
}
