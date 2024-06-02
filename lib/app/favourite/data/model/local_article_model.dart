import 'package:hive_flutter/hive_flutter.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

part 'local_article_model.g.dart';

@HiveType(typeId: 0)
class LocalArticleModel {
  @HiveField(0)
  final String articleId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? link;

  @HiveField(3)
  final List<String>? keywords;

  @HiveField(4)
  final List<String>? creator;

  @HiveField(5)
  final String? videoUrl;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final String? content;

  @HiveField(8)
  final String? pubDate;

  @HiveField(9)
  final String? imageUrl;

  @HiveField(10)
  final String? sourceId;

  @HiveField(11)
  final int? sourcePriority;

  @HiveField(12)
  final String? sourceUrl;

  @HiveField(13)
  final String? sourceIcon;

  @HiveField(14)
  final String? language;

  @HiveField(15)
  final List<String>? country;

  @HiveField(16)
  final List<String>? category;

  @HiveField(17)
  final String? aiTag;

  @HiveField(18)
  final String? sentiment;

  @HiveField(19)
  final String? sentimentStats;

  @HiveField(20)
  final String? aiRegion;

  @HiveField(21)
  final String? aiOrg;

  LocalArticleModel({
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
  });

  // Conversion from Entity to Model
  factory LocalArticleModel.fromEntity(ArticleEntity article) =>
      LocalArticleModel(
        articleId: article.articleId,
        title: article.title,
        link: article.link,
        keywords: article.keywords,
        creator: article.creator,
        videoUrl: article.videoUrl,
        description: article.description,
        content: article.content,
        pubDate: article.pubDate,
        imageUrl: article.imageUrl,
        sourceId: article.sourceId,
        sourcePriority: article.sourcePriority,
        sourceUrl: article.sourceUrl,
        sourceIcon: article.sourceIcon,
        language: article.language,
        country: article.country,
        category: article.category,
        aiTag: article.aiTag,
        sentiment: article.sentiment,
        sentimentStats: article.sentimentStats,
        aiRegion: article.aiRegion,
        aiOrg: article.aiOrg,
      );

  // Conversion from Model to Entity
  ArticleEntity toEntity() => ArticleEntity(
        articleId: articleId,
        title: title,
        link: link,
        keywords: keywords,
        creator: creator,
        videoUrl: videoUrl,
        description: description,
        content: content,
        pubDate: pubDate,
        imageUrl: imageUrl,
        sourceId: sourceId,
        sourcePriority: sourcePriority,
        sourceUrl: sourceUrl,
        sourceIcon: sourceIcon,
        language: language,
        country: country,
        category: category,
        aiTag: aiTag,
        sentiment: sentiment,
        sentimentStats: sentimentStats,
        aiRegion: aiRegion,
        aiOrg: aiOrg,
      );
}
