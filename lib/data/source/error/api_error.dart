import 'package:music_app/data/source/error/api_response.dart';

class ApiError {
  final String? errorCode;
  final String? errorMessage;
  final dynamic extraData;

  ApiError({this.errorCode, this.errorMessage, this.extraData});

  ApiError.fromResponse(ApiResponse response)
      : errorCode = response.errorCode,
        errorMessage = response.errorMessage,
        extraData = response.data;
}
