import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/request/login/login_request_dto.dart';
import '../../features/auth/data/models/request/register/register_request_dto.dart';
import '../../features/auth/data/models/response/auth/auth_response_dto.dart';
import 'api_constants.dart';
import 'end_points.dart';

part 'api_client.g.dart';

@RestApi(baseUrl:ApiConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}
