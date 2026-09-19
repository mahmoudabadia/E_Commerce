import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/core/network/api_result.dart';
import 'package:e_commerce_app/core/errors/app_errors.dart';
import 'package:e_commerce_app/core/utils/connectivity_extensions.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/features/auth/data/mappers/login_request_mapper.dart';
import 'package:e_commerce_app/features/auth/data/mappers/register_request_mapper.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final Connectivity connectivity;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.connectivity,
  });

  @override
  Future<ApiResult<void>> login(LoginRequest loginRequest) async {
    if (await connectivity.isConnected()) {
      //todo : internet => remote
      return  authRemoteDataSource.login(loginRequest.toLoginRequestDto());
    } else {
      //todo : no internet => local
      return ErrorApiResult(errorMessage: NetworkErrors());
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest registerRequest) async {
    if(await connectivity.isConnected()){
      //todo : internet => remote
      return authRemoteDataSource.register(registerRequest.toRegisterRequestDto());
    }else{
      //todo : no internet => local
      return ErrorApiResult(errorMessage: NetworkErrors());
    }
  }
}
