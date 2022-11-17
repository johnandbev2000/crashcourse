import 'package:crashcourse/mocks/mock_location.dart';
import 'package:flutter/material.dart';
import 'location_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final mockLocations = MockLocation.fetchAll();
    return MaterialApp(home: LocationList(mockLocations));
  }
}
