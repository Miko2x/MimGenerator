import 'package:json_annotation/json_annotation.dart';

part 'mim_model.g.dart';


@JsonSerializable(includeIfNull: true)
class MimModel {
  bool success;
  Data data;

  MimModel({
    bool? success,
    Data? data,
  }) :
  success = success ?? false,
  data = data ?? Data();

  factory MimModel.fromJson(Map<String, dynamic> parsedJson) => _$MimModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$MimModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Data {
  List<Meme> memes;

  Data({
    List<Meme>? memes,
  }) :
  memes = memes ?? <Meme>[];

  factory Data.fromJson(Map<String, dynamic> parsedJson) => _$DataFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Meme {
  String id;
  String name;
  String url;
  int width;
  int height;
  @JsonKey(name: 'box_count')
  int boxCount;
  int captions;

  Meme({
    String? id,
    String? name,
    String? url,
    int? width,
    int? height,
    int? boxCount,
    int? captions,
  }) :
  id = id ?? "",
  name = name ?? "",
  url = url ?? "",
  width = width ?? 0,
  height = height ?? 0,
  boxCount = boxCount ?? 0,
  captions = captions ?? 0;

  factory Meme.fromJson(Map<String, dynamic> parsedJson) => _$MemeFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$MemeToJson(this);
}
