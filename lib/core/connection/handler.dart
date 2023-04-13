import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceResponse<T> {
  String? message;
  bool error;
  T? data;

  ServiceResponse({this.data, this.message, required this.error});

  AsyncValue<T> toAsyncValue() {
    return !error
        ? AsyncData(data as T)
        : AsyncError(message!, StackTrace.current);
  }
}

ServiceResponse<T> serveError<T>({required String error}) {
  return ServiceResponse<T>(
    error: true,
    message: error,
  );
}

ServiceResponse<T> serveInternetError<T>() {
  return ServiceResponse<T>(
    error: true,
    message: 'Check your internet connection!',
  );
}

ServiceResponse<T> serveData<T>({required T? value, String? message}) {
  return ServiceResponse<T>(
    error: false,
    data: value,
    message: message,
  );
}

typedef FutureHandler<T> = Future<ServiceResponse<T>>;

Future<ServiceResponse<T>> serveFuture<T>({
  required Future<T> Function(Fail fail) function,
  String Function(Object e)? handleError,
  String Function(T response)? handleData,
}) async {
  try {
    final T response = await function(_fail);
    String? message;
    if (handleData != null) {
      message = handleData(response);
    }
    return serveData<T>(value: response, message: message);
  } on DioError catch (_) {
    if (_.type == DioErrorType.connectionTimeout ||
        _.type == DioErrorType.receiveTimeout) {
      return serveError(error: timeoutE);
    } else if (_.error.toString().contains('SocketException')) {
      return serveInternetError();
    }
    if (_.response == null) {
      return serveError(error: defaultError);
    }
    return serveError(error: defaultError);
  } on ServeException catch (e) {
    return serveError<T>(error: e.message);
  } catch (e) {
    String error = handleError == null ? e.toString() : handleError(e);
    return serveError<T>(error: error);
  }
}

class ServeException implements Exception {
  late final String message;
  ServeException(this.message);
}

typedef Fail = Function(String message);

Never _fail(String message) => throw ServeException(message);

const defaultError = 'Something went wrong';
const timeoutE = 'Connection Timeout';
