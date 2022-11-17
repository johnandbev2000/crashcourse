import 'dart:core';

class Endpoint {
  // NOTE: not realistic! we'll configure environment-specific variables in a soon to be
  // upcoming lesson
  //static const apiScheme = 'https';
  //static const apiHost = 'fluttercrashcourse.com';
  //static const prefix = '/api/v1';
  //static const port = 443;// default for https and :80 for http

  static const apiScheme = 'http';
  static const apiHost = 'localhost';
  static const prefix = '';
  static const port = 5263;// specific port for this localhost project

  static Uri uri(String path, {required Map<String, dynamic> queryParameters}) {
    // ignore: unnecessary_new
   
    // ignore: unnecessary_new
    final uri = new Uri(
        scheme: apiScheme,
        host: apiHost,
        path: '$prefix$path',
        queryParameters: queryParameters,
        port: port);

    return uri;
  }
}
