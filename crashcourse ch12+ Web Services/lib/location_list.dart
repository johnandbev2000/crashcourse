// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_this

import 'dart:async';

import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Locations",
          style: Styles.navBarStyle,
        )),
        body: RefreshIndicator(  // note not seeing refresh indicator ... but moving on /still working
            onRefresh: loadData,
            child: Column(children: [
          renderProgressBar(context),
          Expanded(child: renderListView(context))
        ]))
      );
  }

  Future<void> loadData() async {
    if (this.mounted) {
      setState(() => this.loading = true); // 'rocket' syntax
      //setstate will then hit build again

      // Timer(Duration(milliseconds:8000), () async {
      //using Timer to simualte delay to see progress bar whilst loading
      //in real, all nested code would not be inside timer
      final locations = await Location.fetchAll();
      setState(() {
        // also calls build function
        this.locations = locations;
        this.loading = false;
      });
      //});
    }
  }

  Widget renderProgressBar(BuildContext context) {
    return (this.loading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container());
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
        // ignore: unnecessary_this
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder);
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () {
        // must no params / return nothing
        _navigationToLocationDetail(context, location.id);
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
