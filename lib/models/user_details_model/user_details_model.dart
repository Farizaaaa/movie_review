import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  @JsonKey(name: "name")
  String? name;

  UserDetailsModel({this.name});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
}
