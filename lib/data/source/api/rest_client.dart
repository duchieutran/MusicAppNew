import 'package:dio/dio.dart';
import 'package:music_app/data/source/error/api_error.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  late Dio _dio;
  static const contentType = 'application/json;charset=UTF-8';
  RestClient({required String baseUrl}) {
    BaseOptions _option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout:
          const Duration(seconds: 5), // thời gian tối đa kết nối đến sever
      receiveTimeout: const Duration(
          seconds: 5), // thời gian tối đa chờ nhận phàn hổi từ sever
      contentType: contentType,
    );
    _dio = Dio(_option);

    //pretty
    _dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true, // log rút gọn, tập trung thông tin chính
    ));
  }

  // get
  Future<dynamic> getData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (e) {
      _mapError(e);
    }
  }

  // custom error
  ApiError _mapError(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ApiError(
              errorCode: 'ConnectTimeout',
              errorMessage: 'Lỗi quá hạn kết nối !');
        case DioExceptionType.sendTimeout:
          return ApiError(
              errorCode: 'SendTimeout', errorMessage: 'Lỗi quá hạn gửi !');
        case DioExceptionType.receiveTimeout:
          return ApiError(
              errorCode: 'RêciveTimeout',
              errorMessage: 'Lỗi quá hạn nhận dữ liệu !');
        case DioExceptionType.badResponse:
          if (e.response?.data != null && e.response?.data is Map) {
            String code = '';
            try {
              // vì bên trên kiểm check null rồi nên bên dưới mới được sử dụng
              dynamic error = e.response!.data;
              code = error['code'];
              if (code == '404') {
                return ApiError(
                    errorCode: code,
                    errorMessage:
                        'Không tin thấy trang hoặc tài nguyên yêu cầu !');
              }
            } catch (err) {
              return ApiError(
                  errorCode: code,
                  errorMessage: 'Lỗi không rõ định dạng !',
                  extraData: err);
            }
          } else {
            return ApiError(
                errorCode: '401',
                errorMessage: 'Lỗi không rõ định dạng !',
                extraData: e.response!.data);
          }

        default:
          return ApiError(
            errorCode: '=))) ???',
            errorMessage: 'Lỗi dì vậy má =)))) !',
          );
      }
    }
    return ApiError(extraData: e);
  }
}
