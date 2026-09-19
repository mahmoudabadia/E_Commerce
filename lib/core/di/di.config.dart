// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i299;
import '../../features/auth/data/repository/aurh_repository_impl.dart' as _i267;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/login_useCases.dart' as _i8;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/auth/ui/register/cubit/register_cubit.dart' as _i539;
import '../network/api_client.dart' as _i557;
import '../utils/git_it_module.dart' as _i265;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    gh.lazySingleton<_i361.BaseOptions>(() => gitItModule.baseOptions);
    gh.lazySingleton<_i528.PrettyDioLogger>(() => gitItModule.prettyDioLogger);
    gh.lazySingleton<_i557.ApiClient>(() => gitItModule.provideApiClient);
    gh.lazySingleton<_i895.Connectivity>(() => gitItModule.provideConnectivity);
    gh.factory<_i361.Dio>(
      () => gitItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i432.AuthRemoteDataSource>(
      () => _i299.AuthRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i267.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i432.AuthRemoteDataSource>(),
        connectivity: gh<_i895.Connectivity>(),
      ),
    );
    gh.lazySingleton<_i8.LoginUseCases>(
      () => _i8.LoginUseCases(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(loginUseCases: gh<_i8.LoginUseCases>()),
    );
    gh.factory<_i539.RegisterCubit>(
      () => _i539.RegisterCubit(gh<_i1010.RegisterUseCase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i265.GitItModule {}
