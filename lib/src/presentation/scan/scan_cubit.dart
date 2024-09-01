import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/services/local_data_service.dart';

abstract class ScanState extends Equatable {
  const ScanState();
}

class ScanLoadedState extends ScanState {
  const ScanLoadedState();

  @override
  List<Object> get props => [];
}

class ScanCubit extends Cubit<ScanState> {
  final LocalDataSourceService localDataSourceService;

  ScanCubit(this.localDataSourceService) : super(ScanLoadedState());

  Future<void> onInit() async {}

  Future<void> scan(String? data) async {
    if (data == null || !data.contains('https://mock.framework.com')) {
      throw Exception('Invalid QR code');
    }
    await localDataSourceService.add(
        data, FrameworkMetaDataResponseModel(url: data).toJson());
        
  }
}
