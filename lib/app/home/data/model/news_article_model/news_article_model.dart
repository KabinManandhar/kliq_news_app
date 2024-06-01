import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'news_article_model.g.dart';

@JsonSerializable()
class NewsArticleModel extends Equatable {
  final String status;
  final int totalResults;
  final List<ArticleModel> results;
  final String nextPage;

  const NewsArticleModel({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return _$NewsArticleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);

  NewsArticleModel copyWith({
    String? status,
    int? totalResults,
    List<ArticleModel>? results,
    String? nextPage,
  }) {
    return NewsArticleModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  List<Object?> get props => [status, totalResults, results, nextPage];
}
