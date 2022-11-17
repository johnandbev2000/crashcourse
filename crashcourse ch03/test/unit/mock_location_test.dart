import 'package:test/test.dart';
//import 'package:image_test_utils/image_test_utils.dart';
import 'package:network_image_mock/network_image_mock.dart';

// ignore: avoid_relative_lib_imports
import '../../lib/mocks/mock_location.dart';

void main() {
  test('test fetchAny', (() {
    final mockLocation = MockLocation.fetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  }));

   test('test fetchAll', (() {
    final mockLocations = MockLocation.fetchAll();
    expect(mockLocations.length, greaterThan(0));
    expect(mockLocations[0].name, isNotEmpty);
  }));

    test('test fetch', (() {
    final mockLocation = MockLocation.fetch(0);
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  }));
}
