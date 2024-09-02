import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/models/framework_meta_data_model.dart';
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart';

abstract class ScanState extends Equatable {
  const ScanState();
}

class ScanLoadedState extends ScanState {
  const ScanLoadedState();

  @override
  List<Object> get props => [];
}

@Injectable()
class ScanCubit extends Cubit<ScanState> {
  final FrameworkMetaDataRepository frameworkMetaDataRepository;

  ScanCubit(this.frameworkMetaDataRepository) : super(const ScanLoadedState());

  Future<void> onInit() async {}

  Future<void> scan(String? data) async {
    if (data == null || !data.contains('run.mocky.io')) {
      throw Exception('Invalid QR code');
    }
    frameworkMetaDataRepository
        .addFrameworkMetaData(FrameworkMetaDataResponseModel(url: data));
  }
}
