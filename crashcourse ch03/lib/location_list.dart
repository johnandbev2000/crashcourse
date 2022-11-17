// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  // ignore: use_key_in_widget_constructors
  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Locations",
        style: Styles.navBarStyle,
      )),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: _listViewItemBuilder
          ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = locations[index];
    return ListTile(
     
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () {
        // must no params / return nothing
        _navigationToLocationDetail(context, index);
      },
    );
  }

  void _navigationToLocationDetail(BuildContext context, int locationID) {
    //print(">>>>> ${locations[index].name}");
    Navigator.push(
        context,
        MaterialPageRoute(
            /* 
          builder: (context) {
            return LocationDetail(locations[index]);
          } */
            // would usually use one line syntax as below but showing equivalent long-hand (above)-
            builder: (context) => LocationDetail(locationID)));
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
      style: Styles.textDefault,
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
        constraints: const BoxConstraints.tightFor(width: 100.0),
        child: Image.network(location.url, fit: BoxFit.fitWidth));
  }
}
