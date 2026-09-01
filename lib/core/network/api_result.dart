sealed class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;

  bool get isError => this is ErrorApiResult;

  T? get data => (this as SuccessApiResult).data;

  String? get errorMessage => (this as ErrorApiResult).errorMessage;
}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;

  SuccessApiResult({required this.data});
}

class ErrorApiResult<T> extends ApiResult<T> {
  String? errorMessage;

  ErrorApiResult({required this.errorMessage});
}
