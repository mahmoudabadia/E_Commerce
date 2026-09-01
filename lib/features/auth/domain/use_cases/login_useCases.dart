import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/network/api_result.dart';

class LoginUseCases {
  final AuthRepository _authRepository;

  LoginUseCases(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest loginRequest) {
    return _authRepository.login(loginRequest);
  }
}
