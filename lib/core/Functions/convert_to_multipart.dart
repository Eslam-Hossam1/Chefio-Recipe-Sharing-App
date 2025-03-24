 import 'dart:io';

import 'package:dio/dio.dart';

MultipartFile? convertToMultipart(File? image) {
    return image != null
        ? MultipartFile.fromFileSync(image.path,
            filename: image.path.split('/').last)
        : null;
  }