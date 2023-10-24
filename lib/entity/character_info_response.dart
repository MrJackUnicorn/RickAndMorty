import 'package:json_annotation/json_annotation.dart';

part 'character_info_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CharacterInfoResponse {
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
  CharacterInfoResponse(
    this.avatar,
    this.created,
    this.gender,
    this.id,
    this.name,
    this.species,
    this.status,
    this.type,
  );
  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterInfoResponseToJson(this);
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
