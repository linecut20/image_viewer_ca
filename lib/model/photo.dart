import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'tags')
  final String tags;
  @JsonKey(name: 'previewURL')
  final String previewURL;

  Photo({
    required this.id,
    required this.tags,
    required this.previewURL,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
