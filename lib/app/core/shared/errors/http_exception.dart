import 'package:json_annotation/json_annotation.dart';

part 'http_exception.g.dart';

@JsonSerializable(createToJson: false)
class HttpException {
  HttpException({
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
  });

  int statusCode;
  DateTime timestamp;
  String path;
  String message;

  factory HttpException.fromJson(Map<String, dynamic> json) =>
      _$HttpExceptionFromJson(json);

  @override
  String toString() {
    return 'HttpException{statusCode: $statusCode, timestamp: $timestamp, path: $path, message: $message}';
  }
}
