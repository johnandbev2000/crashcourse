import './location_fact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';
// generate using this (after adding dependency to build_runner):- 
//flutter packages pub run build_runner build
// which generates the .g.dart files

@JsonSerializable()
class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({required this.name, required this.url, required this.facts}); // note optional args

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
