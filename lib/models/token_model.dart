// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.error,
    required this.status,
    required this.message,
    required this.data,
  });

  bool error;
  int status;
  String message;
  String data;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    error: json["error"],
    status: json["status"],
    message: json["message"],
    data: json['data']['token'],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "status": status,
    "message": message,
    "data": data,
  };
}
