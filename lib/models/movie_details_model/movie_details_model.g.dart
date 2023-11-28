// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      movieName: json['movieName'] as String?,
      movieUrl: json['movieUrl'] as String?,
      movieReview: json['movieReview'] as String?,
      like: json['like'] as int?,
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'movieName': instance.movieName,
      'movieUrl': instance.movieUrl,
      'movieReview': instance.movieReview,
      'like': instance.like,
    };
