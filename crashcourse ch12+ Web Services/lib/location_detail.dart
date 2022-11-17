import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  State<StatefulWidget> createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank(); // a constructor

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    // called when mounted -> so then calls loadData
    super.initState();
    loadData();
  }

  loadData() async {
    final location = await Location.fetchByID(locationID);
    if (mounted) {
      setState(() {
        this.location = location; // the one just retrieved into state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name, style: Styles.navBarStyle)),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        )));
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[]; // new list
    // alternative var result2 = List<Widget>.empty(growable: true); // new list
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = <Widget>[]; // new list
    // alternative var result2 = List<Widget>.empty(growable: true); // new list
    var maxCnt = 0;
    if(location.facts != null) {
      maxCnt = location.facts!.length;
    }
    
    for (int i = 0; i < maxCnt; i++) {
      result.add(_sectionTitle(location.facts![i].title));
      result.add(_sectionText(location.facts![i].text));
    }
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child:
            Text(title, textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _sectionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(text, style: Styles.textDefault),
    );
  }

 Widget _bannerImage(String url, double height) {
    if (url.isEmpty) {
      return Container();
    }

    try {
      return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(url, fit: BoxFit.fitWidth),
      );
    } catch (e) {
      print("could not load image $url");
      return Container();
    }
  }
/*
  Widget _section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }*/

}
