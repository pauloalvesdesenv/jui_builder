import 'package:jui_builder/src/domain/services/local_data_service.dart';

abstract class GetFrameworkDataUseCase {
  Future<String> call();
}

class GetFrameworkDataUseCaseImpl implements GetFrameworkDataUseCase {
  final LocalDataSourceService localDataSourceService;

  GetFrameworkDataUseCaseImpl(this.localDataSourceService);

  @override
  Future<String> call() async {
    if(true){

    }
    final data = await localDataSourceService.get('frameworkdata');
    
    return data ?? '';
  }
}