import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate Timeout With ApiServer');
      case DioExceptionType.badResponse:
        ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(' Request to ApiServer Whas Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection ');
      case DioExceptionType.unknown:
        return ServerFailure('Ops There Was An Error , please try again');
    }
    return ServerFailure('there is error ,please try again');
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your Requst Not Found ,please Try Later');
    } else if (statusCode == 500) {
      return ServerFailure('There is problem with server ,please Try Later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There is Error ,please Try Later');
    }
  }
}
