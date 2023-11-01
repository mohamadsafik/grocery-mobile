import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cubit/data/api/network_exceptions.dart';
import 'package:flutter_cubit/data/api/response.dart';

class ErrorHandler {
  static BaseResponse getDioException(error) {
    int status = 405;
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              status = error.response?.statusCode ?? 405;
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = const NetworkExceptions.badRequest();
                  break;
                case 401:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions =
                      const NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.other:
              networkExceptions =
                  NetworkExceptions.defaultError("Error ${error.message}");
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return BaseResponse(
          status: status.toString(),
        );
      } on FormatException {
        return BaseResponse(
          status: status.toString(),
        );
      } catch (_) {
        return BaseResponse(
          status: status.toString(),
        );
      }
    } else {
      log(error.toString());
      if (error.toString().contains("is not a subtype of")) {
        return BaseResponse(
          status: status.toString(),
        );
      } else {
        return BaseResponse(
          status: status.toString(),
        );
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}

extension FutureExt<T> on Future<T> {
  Future<T> summarizeError() {
    return onError((error, stackTrace) async {
      log('$error $stackTrace');
      throw ErrorHandler.getDioException(error);
    });
  }

  Future<T> handler(Function onError) async {
    return summarizeError().catchError(onError);
  }
}
