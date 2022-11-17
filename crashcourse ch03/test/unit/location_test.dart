import 'package:crashcourse/models/location.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  test('test location deserialization', (() {
    const locationJSON = '''{"name": "some testname",
          "url": "www.bbc.co.uk",
          "facts": [
          {"title":"Summary","text":"some text stuff"},
          {"title":"Summary2","text":"some text stuff2"}
          ]
        }''';
    final locationMap = jsonDecode(locationJSON) as Map<String, dynamic>;

    expect("some testname", locationMap['name']);

    final location = Location.fromJson(locationMap);// query says fromJson but is actually a map (?)
    expect(location.name, equals(locationMap["name"]));
    expect(location.url, equals(locationMap["url"]));
  }));
}
