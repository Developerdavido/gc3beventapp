
class ApiResponse {

  int? code;
  String? message;
  String? status;
  dynamic success;
  dynamic body;
  String? errors;


  ApiResponse({
    this.status,
    this.code,
    this.message,
    this.body,
    this.errors
  });

  List get data => body["data"];

  List get listData => body;

  List get listWithoutDataKey => body;

  int get totalDataCount => body["meta"]["total"];

  int get totalPageCount => body["meta"]["total"];

  Map? get mappedData => body["data"];

  Map? get mappedObjects => body;


  bool? get allGood => errors == null || errors!.isEmpty;

  bool? get noBody => errors?.isEmpty;


  factory ApiResponse.parse(response) {
    if (response != null) {
      int? code = response.statusCode;
      dynamic body = response.data ?? null;
      String? errors = "";
      String? message = "";
      String? status  = "";
      switch(code) {
        case 200:
          if (body is String) {
            message = body;
          } else if (body is List){
            message = "Success";
          }else if (body.containsKey("data")) {
            if(body["data"] is Map) {
              message = body["data"]["message"];
            }
          }else {
            if(body is Map){
              message = body["message"];
            }
          }

          break;
        case 201:
          if(body is String) {
            message = body;
          }else {
            if (body.containsKey("data")) {
              if (body["data"] is Map) {
                message = body["data"]["message"];
              }
            }
          }
          break;
        case 204:
          message = "Operation successful";
          break;
        case 401:
          if(body["error"] != null) body["error"];
          if(body["error"] == null) {
            body["message"];
            //when the token returns invalid, clear the data
          }
          message = errors;
          break;
        case 403:
          if (body["data"] == null ) {
            errors = (body["message"]);
          } else {
            errors = (body["data"]["message"]);
            message = errors;
          }
          break;
        case 400:
          if (body["data"] == null ) {
            errors = body["error"];
            message = errors;
          } else {
            errors = (body["data"]["message"]);
            message = errors;
          }
          break;
        case 404:
          if (body["message"] != null) {
            message = body["message"];
          } else {
            message = "Not found";
          }
          errors = (message);
          break;
        case 500:
          message = "Something went wrong, please contact support.";
          errors = (message);
          break;
        default:
          if (body.containsKey('error')) {
            message = body['error'];
          } else {
            message = "Unknown application error.";
            errors = (message);
          }
          break;
      }
      return ApiResponse(
        code: code,
        message: message,
        body: code == 204
            ? null
            : body is String
            ? null
            : body,
        errors: errors,
      );
    }else {
      return ApiResponse(
          code: 500,
          message: "Something went wrong. Please try again"
      );
    }
  }
}