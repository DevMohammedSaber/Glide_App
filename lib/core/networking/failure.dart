import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
class Failure extends Equatable {
  final String message;
  final int? statusCode;
  final Map<String, dynamic>? responseError;

  const Failure({
    required this.message,
    this.statusCode,
    this.responseError,
  });

  /// Creates a [Failure] from a [DioException].
  factory Failure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const FetchDataException('Request timed out. Please try again.');
      case DioExceptionType.badResponse:
        return _handleBadResponse(exception);
      case DioExceptionType.cancel:
        return const FetchDataException('Request was cancelled.');
      case DioExceptionType.unknown:
        return const UnexpectedFailure('An unknown error occurred.');
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return const NoInternetConnectionException('No internet connection.');
    }
  }

  /// Handles bad responses and maps them to appropriate [Failure] objects.
  static Failure _handleBadResponse(DioException exception) {
    final statusCode = exception.response?.statusCode;

    switch (statusCode) {
      case 400:
        return const BadRequestException('Bad request.');
      case 401:
        return const UnauthorizedException('Unauthorized access.');
      case 403:
        return const UnauthorizedException('Forbidden access.');
      case 404:
        return const NotFoundException('Resource not found.');
      case 409:
        return const ConflictException('Conflict occurred.');
      case 500:
        return const InternalServerErrorException('Internal server error.');
      default:
        return const ServerFailure('An error occurred on the server.');
    }
  }

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message, statusCode, responseError];
}

/// Thrown when data fetching fails.
class FetchDataException extends Failure {
  const FetchDataException(String message)
      : super(message: message);

  factory FetchDataException.timeout() =>
      const FetchDataException('Request timed out. Please try again.');
}

/// Thrown when a bad request is made.
class BadRequestException extends Failure {
  const BadRequestException(String message)
      : super(message: message);

  factory BadRequestException.invalidData() =>
      const BadRequestException('Invalid data provided.');
}

/// Thrown when the user is unauthorized.
class UnauthorizedException extends Failure {
  const UnauthorizedException(String message)
      : super(message: message);

  factory UnauthorizedException.invalidToken() =>
      const UnauthorizedException('Invalid or expired token.');
}

/// Thrown when a resource is not found.
class NotFoundException extends Failure {
  const NotFoundException(String message)
      : super(message: message);

  factory NotFoundException.resourceNotFound() =>
      const NotFoundException('The requested resource was not found.');
}

/// Thrown when a conflict occurs.
class ConflictException extends Failure {
  const ConflictException(String message)
      : super(message: message);

  factory ConflictException.duplicateEntry() =>
      const ConflictException('Duplicate entry detected.');
}

/// Thrown when there is an internal server error.
class InternalServerErrorException extends Failure {
  const InternalServerErrorException(String message)
      : super(message: message);

  factory InternalServerErrorException.serverDown() =>
      const InternalServerErrorException('The server is currently down.');
}

/// Thrown when there is no internet connection.
class NoInternetConnectionException extends Failure {
  const NoInternetConnectionException(String message)
      : super(message: message);

  factory NoInternetConnectionException.noNetwork() =>
      const NoInternetConnectionException('No internet connection.');
}

/// Thrown when an unexpected error occurs.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message)
      : super(message: message);

  factory UnexpectedFailure.unknown() =>
      const UnexpectedFailure('An unexpected error occurred.');
}

/// Thrown when a server-related error occurs.
class ServerFailure extends Failure {
  const ServerFailure(String message)
      : super(message: message);

  factory ServerFailure.generic() =>
      const ServerFailure('An error occurred on the server.');
}

/// Thrown when reading a file fails.
class ReadFileFailure extends Failure {
  const ReadFileFailure(String message)
      : super(message: message);

  factory ReadFileFailure.fileNotFound() =>
      const ReadFileFailure('The file could not be found.');
}

/// Thrown when a cache-related error occurs.
class CacheFailure extends Failure {
  const CacheFailure(String message)
      : super(message: message);

  factory CacheFailure.cacheReadError() =>
      const CacheFailure('Failed to read from cache.');
}