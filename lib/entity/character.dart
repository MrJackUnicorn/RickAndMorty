import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  @JsonKey(name: 'image')
  String? avatar;
  List<String>? episode;
  String? url;
  String? created;
  Character(
    this.avatar,
    this.created,
    this.gender,
    this.id,
    this.name,
    this.species,
    this.status,
    this.type,
  );
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  String? name;
  String? url;

  Location(this.name, this.url);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
