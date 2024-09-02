import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/client/jui_builder_http_client.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/errors/framework_meta_data_errors.dart';
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart';

abstract class BaseState {}

class BaseLoadingState extends BaseState {}

class BaseErrorState extends BaseState {
  final String message;

  BaseErrorState(this.message);
}

class BaseLoadedState extends BaseState {
  final FrameworkMetaDataResponseModel? frameworkMetaDataResponseModel;

  BaseLoadedState({this.frameworkMetaDataResponseModel});
}

@Injectable()
class BaseCubit extends Cubit<BaseState> {
  final FrameworkMetaDataRepository frameworkMetaDataRepository;
  final JuiBuilderHttpClient httpClient;

  BaseCubit(this.frameworkMetaDataRepository, this.httpClient)
      : super(BaseLoadingState());

  Future<void> onInit() async {
    await fetchFrameworkMetaData();
  }

  Future<void> fetchFrameworkMetaData() async {
    try {
      final frameworkMetaDataResponseModel =
          await frameworkMetaDataRepository.getFrameworkMetaData();
      httpClient.setup(frameworkMetaDataResponseModel.url);
      emit(BaseLoadedState(
          frameworkMetaDataResponseModel: frameworkMetaDataResponseModel));
    } on FrameworkMetaDataNotFound catch (_) {
      emit(BaseLoadedState());
    } catch (e) {
      emit(BaseErrorState(e.toString()));
    }
  }
}
