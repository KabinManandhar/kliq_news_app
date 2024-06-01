import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

enum FavouriteStateStatus { loading, success, failure }

class FavouriteState {
  final Set<ArticleEntity> articles;
  final FavouriteStateStatus status;

  FavouriteState({required this.articles, required this.status});

  FavouriteState copyWith({
    Set<ArticleEntity>? articles,
    FavouriteStateStatus? status,
  }) {
    return FavouriteState(
      articles: articles ?? this.articles,
      status: status ?? this.status,
    );
  }
}
