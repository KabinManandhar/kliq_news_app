import 'package:kliq_news_app/app/favourite/presentation/provider/favourite_states.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_provider.g.dart';

@Riverpod(keepAlive: true)
class FavouriteNotifier extends _$FavouriteNotifier {
  @override
  FavouriteState build() {
    return FavouriteState(articles: {}, status: FavouriteStateStatus.success);
  }

  void addToFavourite(ArticleEntity articleEntity) {
    if (!state.articles.contains(articleEntity)) {
      state = FavouriteState(
          articles: {...state.articles, articleEntity},
          status: FavouriteStateStatus.success);
    }
  }

  void removeFromFavourite(ArticleEntity articleEntity) {
    if (!state.articles.contains(articleEntity)) {
      state = FavouriteState(
          articles: (state.articles
              .where((p) => p.articleId != articleEntity.articleId)
              .toSet()),
          status: FavouriteStateStatus.success);
    }
  }
}
