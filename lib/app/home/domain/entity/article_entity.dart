import 'package:equatable/equatable.dart';
import 'package:kliq_news_app/app/home/data/model/news_article_model/article_model.dart';

class ArticleEntity extends Equatable {
  final String articleId;
  final String title;
  final String? link;
  final List<String>? keywords;
  final List<String>? creator; // Assuming creator is always a string
  final String? videoUrl; // Assuming videoUrl is always a string
  final String? description;
  final String? content;
  final String? pubDate;
  final String? imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? language;
  final List<String>? country;
  final List<String>? category;
  final String? aiTag;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiRegion;
  final String? aiOrg;

  const ArticleEntity({
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

  factory ArticleEntity.fromModel(ArticleModel model) {
    return ArticleEntity(
      articleId: model.articleId ?? '',
      title: model.title ?? '',
      link: model.link ?? '',
      keywords: model.keywords ?? [],
      creator: model.creator ?? [],
      videoUrl: model.videoUrl ?? '',
      description: model.description ?? '',
      content: model.content ?? '',
      pubDate: model.pubDate ?? '',
      imageUrl: model.imageUrl ?? '',
      sourceId: model.sourceId ?? '',
      sourcePriority: model.sourcePriority ?? 0,
      sourceUrl: model.sourceUrl ?? '',
      sourceIcon: model.sourceIcon ?? '',
      language: model.language ?? '',
      country: model.country ?? [],
      category: model.category ?? [],
      aiTag: model.aiTag ?? '',
      sentiment: model.sentiment ?? '',
      sentimentStats: model.sentimentStats ?? '',
      aiRegion: model.aiRegion ?? '',
      aiOrg: model.aiOrg ?? '',
    );
  }

  ArticleModel toModel() {
    return ArticleModel(
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

  @override
  List<Object?> get props => [
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
