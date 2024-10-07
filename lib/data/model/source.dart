
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';


@JsonSerializable()
class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$NewsResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NewsResponseToJson`.
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}