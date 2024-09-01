import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/errors/framework_meta_data_errors.dart';
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart';

abstract class BaseState extends Equatable {}

class BaseLoadingState extends BaseState {
  @override
  List<Object> get props => [];
}

class BaseErrorState extends BaseState {
  final String message;

  BaseErrorState(this.message);
  @override
  List<Object> get props => [];
}

class BaseLoadedState extends BaseState {
  final FrameworkMetaDataResponseModel? frameworkMetaDataResponseModel;

  BaseLoadedState({this.frameworkMetaDataResponseModel});

  @override
  List<Object?> get props => [frameworkMetaDataResponseModel];
}

class BaseCubit extends Cubit<BaseState> {
  final FrameworkMetaDataRepository frameworkMetaDataRepository;

  BaseCubit(this.frameworkMetaDataRepository) : super(BaseLoadingState());

  Future<void> onInit() async {
    await fetchFrameworkMetaData();
  }

  Future<void> fetchFrameworkMetaData() async {
    try {
      final frameworkMetaDataResponseModel =
          await frameworkMetaDataRepository.getFrameworkMetaData();
      emit(BaseLoadedState(
          frameworkMetaDataResponseModel: frameworkMetaDataResponseModel));
    } on FrameworkMetaDataNotFound catch (_) {
      emit(BaseLoadedState());
    } catch (e) {
      emit(BaseErrorState(e.toString()));
    }
  }
}
