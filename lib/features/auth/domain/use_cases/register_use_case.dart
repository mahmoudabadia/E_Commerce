import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
@LazySingleton()
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<ApiResult<void>> call(RegisterRequest registerRequest) {
    return _authRepository.register(registerRequest);
  }
}
