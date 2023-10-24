import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/entity/character.dart';
part 'char_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CharResponse {
  @JsonKey(name: 'results')
  final List<Character> chars;
  late int? page;
  late int? pages;

  CharResponse(this.page, {required this.chars});
  factory CharResponse.fromJson(Map<String, dynamic> json) =>
      _$CharResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharResponseToJson(this);
}
