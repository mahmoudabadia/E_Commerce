import 'package:e_commerce_app/core/network/api_result.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';

abstract class AuthRepository {
  Future<ApiResult<void>> login(LoginRequest loginRequest);

  Future<ApiResult<void>> rgister(RegisterRequest registerRequest);
}
