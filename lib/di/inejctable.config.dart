// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:jui_builder/di/inejctable_module.dart' as _i443;
import 'package:jui_builder/src/data/jui_data_source.dart' as _i1053;
import 'package:jui_builder/src/data/repository/jui_repository_impl.dart'
    as _i662;
import 'package:jui_builder/src/domain/repository/jui_repository.dart' as _i550;
import 'package:jui_builder/src/presentation/jui/jui_cubit.dart' as _i821;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioClient);
    gh.factory<_i1053.JuiDataSource>(
        () => _i1053.JuiRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i550.JuiRepository>(
        () => _i662.JuiRepositoryImpl(gh<_i1053.JuiDataSource>()));
    gh.factory<_i821.JuiCubit>(() => _i821.JuiCubit(gh<_i550.JuiRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i443.InjectableModule {}
