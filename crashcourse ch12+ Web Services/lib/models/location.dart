import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import './location_fact.dart';
import '../endpoint.dart';
import 'dart:convert';

part 'location.g.dart';
// generate using this (after adding dependency to build_runner):-
//flutter packages pub run build_runner build
// which generates the .g.dart files

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact>? facts;

  Location(
    this.id,
      {
      required this.name,
      required this.url,
      required this.facts});

  // query interesting syntax for initialising on constructor (name constructor)
  Location.blank() : id = 0, name = '', url = '', facts = <LocationFact>[];
  

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
 