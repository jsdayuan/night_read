// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoData _$PhotoDataFromJson(Map<String, dynamic> json) => PhotoData(
      json['albumId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
      json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$PhotoDataToJson(PhotoData instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
