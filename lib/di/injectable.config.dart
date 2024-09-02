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
import 'package:jui_builder/di/injectable_module.dart' as _i960;
import 'package:jui_builder/src/data/client/jui_builder_http_client.dart'
    as _i786;
import 'package:jui_builder/src/data/data_source/framework_meta_data_source.dart'
    as _i820;
import 'package:jui_builder/src/data/data_source/jui_data_source.dart' as _i395;
import 'package:jui_builder/src/data/repository/framework_meta_data_impl.dart'
    as _i534;
import 'package:jui_builder/src/data/repository/jui_repository_impl.dart'
    as _i662;
import 'package:jui_builder/src/domain/repository/framework_meta_data_repository.dart'
    as _i12;
import 'package:jui_builder/src/domain/repository/jui_repository.dart' as _i550;
import 'package:jui_builder/src/domain/services/local_data_service.dart'
    as _i609;
import 'package:jui_builder/src/presentation/base/base_cubit.dart' as _i806;
import 'package:jui_builder/src/presentation/jui/jui_cubit.dart' as _i821;
import 'package:jui_builder/src/presentation/scan/scan_cubit.dart' as _i688;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.lazySingleton<_i609.LocalDataSourceService>(
        () => injectableModule.localDataSourceService);
    gh.lazySingletonAsync<_i460.SharedPreferences>(
        () => injectableModule.sharedPreferences);
    gh.factory<_i786.JuiBuilderHttpClient>(
        () => _i786.JuiBulderHttpClientImpl(gh<_i361.Dio>()));
    gh.factory<_i820.FrameworkMetaDataSource>(() =>
        _i820.FrameworkLocalDataSourceImpl(gh<_i609.LocalDataSourceService>()));
    gh.factory<_i395.JuiDataSource>(
        () => _i395.JuiAssetDataSourceImpl(gh<_i786.JuiBuilderHttpClient>()));
    gh.factory<_i550.JuiRepository>(
        () => _i662.JuiRepositoryImpl(gh<_i395.JuiDataSource>()));
    gh.factory<_i12.FrameworkMetaDataRepository>(() =>
        _i534.FrameworkMetaDataRepositoryImpl(
            gh<_i820.FrameworkMetaDataSource>()));
    gh.factory<_i688.ScanCubit>(
        () => _i688.ScanCubit(gh<_i12.FrameworkMetaDataRepository>()));
    gh.factory<_i806.BaseCubit>(() => _i806.BaseCubit(
          gh<_i12.FrameworkMetaDataRepository>(),
          gh<_i786.JuiBuilderHttpClient>(),
        ));
    gh.factory<_i821.JuiCubit>(() => _i821.JuiCubit(
          httpClient: gh<_i786.JuiBuilderHttpClient>(),
          juiRepository: gh<_i550.JuiRepository>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i960.InjectableModule {}
