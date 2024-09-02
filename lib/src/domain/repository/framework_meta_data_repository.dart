import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';

abstract class FrameworkMetaDataRepository {
  Future<FrameworkMetaDataResponseModel> getFrameworkMetaData();
  Future<void> addFrameworkMetaData(FrameworkMetaDataResponseModel frameworkMetaData);
}
