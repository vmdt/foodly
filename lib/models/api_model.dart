import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  String status;
  int code;
  String message;

  ApiError({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
