// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'char_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharResponse _$CharResponseFromJson(Map<String, dynamic> json) => CharResponse(
      json['page'] as int?,
      chars: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..pages = json['pages'] as int?;

Map<String, dynamic> _$CharResponseToJson(CharResponse instance) =>
    <String, dynamic>{
      'results': instance.chars.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'pages': instance.pages,
    };
