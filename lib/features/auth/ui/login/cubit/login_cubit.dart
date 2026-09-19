import 'package:e_commerce_app/core/utils/resource.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/use_cases/login_useCases.dart';
import 'package:e_commerce_app/features/auth/ui/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCases loginUseCases;

  LoginCubit({required this.loginUseCases}) : super(LoginStates.initial());

  void login(String email, String password) async {
    //todo : loading
    emit(LoginStates(loginState: Resource.loading()));
    //todo : log=gin => usecase
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    var result = await loginUseCases(loginRequest);
    if (result.isSuccess) {
      //todo : success=>
      emit(LoginStates(loginState: Resource.success(data: null)));
    } else {
      //todo : error=>
      emit(
        LoginStates(loginState: Resource.error(message: result.getError.error)),
      );
    }
  }
}
