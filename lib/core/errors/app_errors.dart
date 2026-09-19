abstract class AppErrors {
  String error;

  AppErrors({required this.error});
}

class ServerErrors extends AppErrors {
  ServerErrors({String message = "Server is down please try again later"})
    : super(error: message);
}

class NetworkErrors extends AppErrors {
  NetworkErrors({String message = "Please check your internet connection"})
    : super(error: message);
}

class IgnoredErrors extends AppErrors {
  IgnoredErrors({String message = ''}) : super(error: message);
}

class UnknownErrors extends AppErrors {
  UnknownErrors({
    String message = "Something went wrong please try again later",
  }) : super(error: message);
}
