import 'package:e_commerce_app/core/errors/app_errors.dart';

enum ApiStatus {
  initial,
  loading,
  error,
  success
}

class Resource<T> {
  T? data;
  String? message;
  ApiStatus? status;

  Resource({this.data, this.message, this.status});

  Resource.initial(){
    status = ApiStatus.initial;
  }

  Resource.loading(){
    status = ApiStatus.loading;
  }

  Resource.success({required this.data}){
    status = ApiStatus.success;
  }

  Resource.error({required this.message}){
    status = ApiStatus.error;
  }


  bool get isLoading => status == ApiStatus.loading;

  bool get isSuccess => status == ApiStatus.success;

  bool get isError => status == ApiStatus.error;
}


