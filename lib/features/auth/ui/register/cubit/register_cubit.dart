import 'package:e_commerce_app/core/utils/resource.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/auth/ui/register/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase)
      : super(RegisterStates.initial());

  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String rePassword,
  }) async {
    emit(RegisterStates(registerState: Resource.loading()));

    RegisterRequest registerRequest = RegisterRequest(
      email: email,
      password: password,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );

    var result = await registerUseCase(registerRequest);

    if (result.isSuccess) {
      emit(RegisterStates(registerState: Resource.success(data: null)));
    } else {
      emit(
        RegisterStates(
          registerState: Resource.error(message: result.getError.error),
        ),
      );
    }
  }
}