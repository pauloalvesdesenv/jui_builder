import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/client/jui_builder_http_client.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/repository/jui_repository.dart';

class JuiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class JuiLoadingState extends JuiState {}

class JuiErrorState extends JuiState {
  final String message;
  JuiErrorState(this.message);
}

class JuiLoadedState extends JuiState {
  final dynamic jui;
  JuiLoadedState(this.jui);
}

@Injectable()
class JuiCubit extends Cubit<JuiState> {
  final JuiRepository juiRepository;
  final JuiBuilderHttpClient httpClient;
  JuiCubit({required this.httpClient, required this.juiRepository})
      : super(JuiLoadingState());

  Future<void> onInit(FrameworkMetaDataResponseModel frameworkMetaData) async {
    try {
      await httpClient.get(frameworkMetaData.url);
      final json = await fetchJsonUI();
      emit(JuiLoadedState(json));
    } catch (e) {
      emit(JuiErrorState(e.toString()));
    }
  }

  Future<dynamic> fetchJsonUI() async => juiRepository.getJson();
}
