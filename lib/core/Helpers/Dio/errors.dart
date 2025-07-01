import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  final dynamic error;

  ServerException(this.error);
}

class CacheException implements Exception {}

Future<Either<String, T>> basicErrorHandling<T>({
  required Future<T> Function() onSuccess,
  required Future<String> Function(ServerException exception) onServerError,
  required Future<String> Function(CacheException exception) onCacheError,
  required Future<String> Function(Exception exception) onOtherError,
}) async {
  try {
    final f = await onSuccess();
    return Right(f);
  } on ServerException catch (e, s) {
    if (kDebugMode) {
      print(s);
    }
    final f = await onServerError(e);
    return Left(f);
    // return const Left('Server Error');
  } on CacheException catch (e) {
    if (kDebugMode) {
      print(e);
    }
    final f = await onCacheError(e);
    return Left(f);
    // return const Left('Cache Error');
  } on Exception catch (e, s) {
    if (kDebugMode) {
      print(s);
    }
    final f = await onOtherError(e);
    return Left(f);
    // return Left(e.toString());
  }
}

bool showLogin = false;

void errorHandel(DioException error) {
  if (error.type == DioExceptionType.badResponse) {
    if (error.response?.statusCode == 401) {
      // if (!showLogin) {
      //   authProvider(appNavigatorGlobal.currentContext).logout(appNavigatorGlobal.currentContext);
      //   showDialog(
      //       barrierDismissible: false,
      //       context: appNavigatorGlobal.currentContext!,
      //       builder: (context) {
      //         return const SessionEndDialog();
      //       });
      //   showLogin = true;
      // }
    }
    if (kDebugMode) {
      print("Bad Response Error: ${error.toString()}");
    }
  } else if (error.type == DioExceptionType.connectionError) {
    if (kDebugMode) {
      print("Connection Error: ${error.toString()}");
    }
    showErrorToast(message: "Connection Error", type: "error");
  } else if (error.type == DioExceptionType.connectionTimeout) {
    if (kDebugMode) {
      print("Connection TimeOut Error: ${error.toString()}");
    }
  } else if (error.type == DioExceptionType.unknown) {
    if (kDebugMode) {
      print("Parsing Error: ${error.toString()}");
    }
  } else {
    if (kDebugMode) {
      print(" Error: ${error.toString()}");
    }
  }
}

void showErrorToast({required String message, required String type}) {
  switch (type) {
    case "success":
      // Fluttertoast.showToast(
      //   msg: message,
      //   toastLength: Toast.LENGTH_SHORT,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      // );
      break;
    case "error":
      // Fluttertoast.showToast(
      //   msg: message,
      //   toastLength: Toast.LENGTH_SHORT,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      // );
      break;
  }
}
