// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['image'] as String?,
      json['created'] as String?,
      json['gender'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['species'] as String?,
      json['status'] as String?,
      json['type'] as String?,
    )
      ..origin = json['origin'] == null
          ? null
          : Location.fromJson(json['origin'] as Map<String, dynamic>)
      ..location = json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>)
      ..episode =
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..url = json['url'] as String?;

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.avatar,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
