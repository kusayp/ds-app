import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Violation {
  final String message;
  final String fieldName;

  Violation(this.message, this.fieldName);

  Violation.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        fieldName = json['fieldName'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'fieldName': fieldName,
      };
}

class ApiException implements Exception {
  String error;
  String message;

  ApiException(this.message) : super();

  String getError() {
    return error;
  }

  void setError(String error) {
    this.error = error;
  }

  String getMessage() {
    return message;
  }

  void setMessage(String message) {
    this.message = message;
  }
}

class RestErrorHandling {
  String handleError(Response response) {
    // your error handling here

    ApiException apiException = new ApiException(response.body);

    String message = getErrorMessage(response);
    apiException.setMessage(message);
    throw apiException;
  }

  String getErrorMessage(Response response) {
    String text = response.body;
    print("Error message, " + text);
    switch (response.statusCode) {
      case HttpStatus.unauthorized:
        return "User not authorised";
      case HttpStatus.conflict:
        return geConflictMessage(text);
//      case NOT_FOUND:
//        return geBadRequestMessage(text);
      case HttpStatus.internalServerError:
      case HttpStatus.badRequest:
      default:
        return getDefaultMessage(text);
    }
  }

  String getDefaultMessage(String text) {
    Map<String, dynamic> json = jsonDecode(text);
    if (json.containsKey("message"))
      return json["message"].toString();
    else {
      return "We have detected, please try again";
    }
  }

  String geBadRequestMessage(String text) {
    Map<String, dynamic> json = jsonDecode(text);
    if (json.containsKey("violations")) {
      try {
        var list = json['violations'] as List;
        List<Violation> violations = json['result'] != null
            ? list.map((e) => Violation.fromJson(e)).toList()
            : [];

        if (violations.length > 0) {
          return "${violations[0].fieldName} ${violations[0].message}";
        }
      } on IOException catch (e) {
        print(e);
      }
    }
    return json["message"].toString();
  }

  String geConflictMessage(String text) {
    Map<String, dynamic> json = jsonDecode(text);

    if (json.containsKey("violations")) {
      try {
        var list = json['violations'] as List;
        List<Violation> violations = json['result'] != null
            ? list.map((e) => Violation.fromJson(e)).toList()
            : [];

        if (violations.length > 0) {
          String message = violations[0].message;

          List<String> splits = message.split("detail: key");
          if (splits.length > 1) {
            List<String> splits1 = splits[1].split("\\)=\\(");
            if (splits1.length > 1) {
              String key = splits1[0].trim().substring(1);
              String value = splits1[1].split("\\)")[1].trim();
              return "$key: $value n'est pas disponible";
            }
          }
        }
      } on IOException catch (e) {
        print(e);
      }
    }

    return "Information fournit n'est pas valide";
  }
}
