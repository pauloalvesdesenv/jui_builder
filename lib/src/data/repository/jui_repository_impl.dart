import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/data/data_source/jui_data_source.dart';
import 'package:jui_builder/src/domain/repository/jui_repository.dart';

@Injectable(as: JuiRepository)
class JuiRepositoryImpl implements JuiRepository {
  final JuiDataSource _juiDataSource;

  JuiRepositoryImpl(this._juiDataSource);

  @override
  Future<dynamic> getJson() => _juiDataSource.getJson();
}
