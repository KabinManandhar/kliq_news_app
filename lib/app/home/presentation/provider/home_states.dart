import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

enum HomeStateStatus { loading, success, failure }

class HomeState {
  final Set<ArticleEntity> articles;
  final HomeStateStatus status;

  HomeState({required this.articles, required this.status});

  HomeState copyWith({
    Set<ArticleEntity>? articles,
    HomeStateStatus? status,
  }) {
    return HomeState(
      articles: articles ?? this.articles,
      status: status ?? this.status,
    );
  }
}
