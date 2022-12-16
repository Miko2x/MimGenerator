// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MimModel _$MimModelFromJson(Map<String, dynamic> json) => MimModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MimModelToJson(MimModel instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      memes: (json['memes'] as List<dynamic>?)
          ?.map((e) => Meme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'memes': instance.memes,
    };

Meme _$MemeFromJson(Map<String, dynamic> json) => Meme(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      boxCount: json['box_count'] as int?,
      captions: json['captions'] as int?,
    );

Map<String, dynamic> _$MemeToJson(Meme instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'box_count': instance.boxCount,
      'captions': instance.captions,
    };
