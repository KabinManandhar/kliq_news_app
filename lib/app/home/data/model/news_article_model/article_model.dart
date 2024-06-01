// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  @override
  @JsonKey(name: 'article_id')
  final String articleId;
  @override
  final String title;
  @override
  final String? link;
  @override
  final List<String>? keywords;
  @override
  final List<String>? creator;
  @override
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  @override
  final String? description;
  @override
  final String? content;
  @override
  final String? pubDate;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'source_id')
  final String? sourceId;
  @override
  @JsonKey(name: 'source_priority')
  final int? sourcePriority;
  @override
  @JsonKey(name: 'source_url')
  final String? sourceUrl;
  @override
  @JsonKey(name: 'source_icon')
  final String? sourceIcon;
  @override
  final String? language;
  @override
  final List<String>? country;
  @override
  final List<String>? category;
  @override
  @JsonKey(name: 'ai_tag')
  final String? aiTag;
  @override
  final String? sentiment;
  @override
  @JsonKey(name: 'sentiment_stats')
  final String? sentimentStats;
  @override
  @JsonKey(name: 'ai_region')
  final String? aiRegion;
  @override
  @JsonKey(name: 'ai_org')
  final String? aiOrg;

  ArticleModel({
    required this.articleId,
    required this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
  }) : super(
            articleId: '',
            title: '',
            link: '',
            keywords: [],
            creator: [],
            videoUrl: '',
            description: '',
            content: '',
            pubDate: '',
            imageUrl: '',
            sourceId: '',
            sourcePriority: 0,
            sourceUrl: '',
            sourceIcon: '',
            language: '',
            country: [],
            category: [],
            aiTag: '',
            sentiment: '',
            sentimentStats: '',
            aiRegion: '',
            aiOrg: '');

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return _$ArticleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  ArticleEntity toEntity() {
    return ArticleEntity(
      articleId: articleId,
      title: title,
      link: link,
      keywords: keywords ?? [],
      creator: creator ?? [],
      videoUrl: videoUrl ?? '',
      description: description,
      content: content ?? '',
      pubDate: pubDate,
      imageUrl: imageUrl ?? '',
      sourceId: sourceId,
      sourcePriority: sourcePriority,
      sourceUrl: sourceUrl ?? '',
      sourceIcon: sourceIcon ?? '',
      language: language ?? '',
      country: country ?? [],
      category: category ?? [],
      aiTag: aiTag ?? '',
      sentiment: sentiment ?? '',
      sentimentStats: sentimentStats ?? '',
      aiRegion: aiRegion ?? '',
      aiOrg: aiOrg ?? '',
    );
  }

  @override
  List<Object?> get props {
    return [
      articleId,
      title,
      link,
      keywords,
      creator,
      videoUrl,
      description,
      content,
      pubDate,
      imageUrl,
      sourceId,
      sourcePriority,
      sourceUrl,
      sourceIcon,
      language,
      country,
      category,
      aiTag,
      sentiment,
      sentimentStats,
      aiRegion,
      aiOrg,
    ];
  }
}
