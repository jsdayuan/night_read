import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends Object {
  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'mobile')
  String mobile;

  UserData(
    this.username,
    this.password,
    this.mobile,
  );

  factory UserData.fromJson(Map<String, dynamic> srcJson) =>
      _$UserDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
