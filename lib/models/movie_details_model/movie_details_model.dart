import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  @JsonKey(name: "movieName")
  String? movieName;
  @JsonKey(name: "movieUrl")
  String? movieUrl;
  @JsonKey(name: "movieReview")
  String? movieReview;
  @JsonKey(name: "like")
  int? like;

  MovieDetailsModel({
    this.movieName,
    this.movieUrl,
    this.movieReview,
    this.like,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
