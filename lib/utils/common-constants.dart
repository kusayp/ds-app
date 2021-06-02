import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

class CommonConstants {
  static final baseUrl =
      "http://dgsapi-env.g5yjwpkx2w.eu-west-1.elasticbeanstalk.com/api/v1/";
  static final baseUri = "dgsapi-env.g5yjwpkx2w.eu-west-1.elasticbeanstalk.com";
  static final schoolUrl = "/api/v1/schools/";
  static final mobileUrl = "/api/v1/mobile/";
  static var apiKey = "";

  static String getData() {
    final DynamicLibrary nativeAddLib = Platform.isAndroid
        ? DynamicLibrary.open("libapi_util.so")
        : DynamicLibrary.process();

    final Pointer<Utf8> Function() apiFunction = nativeAddLib
        .lookup<NativeFunction<Pointer<Utf8> Function()>>("get_api_key")
        .asFunction();

    // final apiKeyPointer = nativeAddLib.lookup<NativeFunction<Pointer<Utf8> Function()>>('get_api_key');
    // final apiFunction = apiKeyPointer.asFunction<Pointer<Utf8> Function()>();
    apiKey = Utf8.fromUtf8(apiFunction());

    // final Pointer<Utf8> Function() urlFunction =
    // nativeAddLib
    //     .lookup<NativeFunction<Pointer<Utf8> Function()>>("get_api_url")
    //     .asFunction();

    // var apiUrlPointer = nativeAddLib.lookup<NativeFunction<Pointer<Utf8> Function()>>('get_api_url');
    // var apiUrlFunction = apiUrlPointer.asFunction<Pointer<Utf8> Function()>();
    // baseUrl = Utf8.fromUtf8(urlFunction());
  }
}
