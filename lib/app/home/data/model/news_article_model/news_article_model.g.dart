// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticleModel _$NewsArticleModelFromJson(Map<String, dynamic> json) =>
    NewsArticleModel(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String,
    );

Map<String, dynamic> _$NewsArticleModelToJson(NewsArticleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
      'nextPage': instance.nextPage,
    };
