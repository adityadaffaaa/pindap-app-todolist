import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/api/exceptions.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:pindap_todolist/utils/type.dart';

class ApiDio {
  Dio dio = Dio();

  final String _baseUrl = Constants.API_BASE_URL;

  final Logger logger = Logger();

  Future<dynamic> get(
    final String url, {
    final JSON? headers,
  }) async {
    dynamic responseJson;

    if (await AppExtensions.hasConnection()) {
      logger.d('$_baseUrl$url');
      try {
        final Response<dynamic> response = await dio.get(
          '$_baseUrl$url',
          options: Options(
            headers: headers,
            validateStatus: (final int? value) => true,
          ),
        );

        logger.i('response ${response.data}');

        responseJson = response.data;
      } catch (e) {
        throw OtherException(e);
      }
    } else {
      throw NetworkException();
    }

    return responseJson;
  }

  Future<dynamic> post(
    final String url, {
    final JSON? formData,
    final JSON? headers,
  }) async {
    dynamic responseJson;

    if (await AppExtensions.hasConnection()) {
      logger.d('$_baseUrl$url');
      try {
        final Response<dynamic> response = await dio.post(
          '$_baseUrl$url',
          data: formData,
          options: Options(
            headers: headers,
            validateStatus: (final int? value) => true,
          ),
        );

        logger.i('formDataFields $formData');

        responseJson = response.data;
      } catch (e) {
        throw OtherException(e);
      }
    } else {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> put(
    final String url, {
    final JSON? formData,
    final JSON? headers,
  }) async {
    dynamic responseJson;

    if (await AppExtensions.hasConnection()) {
      logger.d('$_baseUrl$url');
      try {
        final Response<dynamic> response = await dio.put(
          '$_baseUrl$url',
          data: formData,
          options: Options(
            headers: headers,
            validateStatus: (final int? value) => true,
          ),
        );

        logger.i('formDataFields $formData');

        responseJson = response.data;
      } catch (e) {
        throw OtherException(e);
      }
    } else {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> delete(final String url, {final JSON? headers}) async {
    dynamic responseJson;

    if (await AppExtensions.hasConnection()) {
      final Response<dynamic> response = await dio.delete(
        '$_baseUrl$url',
        options: Options(
          headers: headers,
          validateStatus: (final int? value) => true,
        ),
      );

      responseJson = response.data;
    } else {
      throw NetworkException();
    }

    return responseJson;
  }
}
