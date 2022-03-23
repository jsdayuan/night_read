import 'package:json_annotation/json_annotation.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData {
  /// The generated code assumes these values exist in JSON.
  final String title, body;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int userId,id;

  PostData(this.title, this.body, this.userId,this.id);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}