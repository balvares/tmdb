// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpException _$HttpExceptionFromJson(Map<String, dynamic> json) =>
    HttpException(
      statusCode: json['statusCode'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      path: json['path'] as String,
      message: json['message'] as String,
    );
