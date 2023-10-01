import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/app/data/base_api/api_exception/api_exception.dart';
import 'package:news_app/app/data/theme/color_manager.dart';

mixin ExceptionHandler {
  String handleError(error) {
    if (error is BadRequestException ||
        error is FetchDataException ||
        error is ApiNotRespondingException ||
        error is ServerException ||
        error is UnAuthorizedException ||
        error is NotFound) {
      Get.snackbar(
        "Error",
        error.message ?? 'An unknown error occurred.',
        backgroundColor: ColorManager().darkRed,
      );
      log(error.message != null
          ? 'error: ${error.message}'
          : 'An unknown error occurred. Type $error. Url ${error.url}');
      return error.message ?? 'An unknown error occurred.';
    } else {
      log(error.toString());
      return error.toString();
    }
  }
}
