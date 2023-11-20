class ExceptionPasswordWeak implements Exception{
  @override
  String toString() {
    return "this is password is to weak";
  }
}
class ExceptionAccountAlreadyExists implements Exception {
  @override
  String toString() {
    return "the account already exists for that email";
  }
}
class ExceptionInvalidLoginCredentials implements Exception {
  @override
  String toString() {
    return "Invalid login credentials";
  }
}

class ExceptionNetworkRequestFailed implements Exception {
  @override
  String toString() {
    return "Network request failed";
  }
}

class ExceptionInvalidEmail implements Exception {
  @override
  String toString() {
    return "Invalid email";
  }
}