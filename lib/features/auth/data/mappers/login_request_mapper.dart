import 'package:e_commerce_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
