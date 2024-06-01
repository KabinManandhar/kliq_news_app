import 'package:hive/hive.dart';
import 'package:kliq_news_app/app/favourite/data/data_source/local_data_source.dart';
import 'package:kliq_news_app/app/favourite/data/model/local_article_model.dart';
import 'package:kliq_news_app/app/favourite/data/repository/favourite_article_repository_impl.dart';
import 'package:kliq_news_app/app/favourite/domain/repository/favourite_article_repository.dart';
import 'package:kliq_news_app/app/favourite/domain/usecases/add_to_favourite_use_case.dart';
import 'package:kliq_news_app/app/favourite/domain/usecases/get_favourite_use_case.dart';
import 'package:kliq_news_app/app/favourite/domain/usecases/remove_from_favourite_use_case.dart';
import 'package:kliq_news_app/app/favourite/presentation/provider/favourite_states.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_provider.g.dart';

//!---------Value Type Providers---------
@riverpod
FavouriteArticleLocalDataSource favouriteArticleLocalDataSource(
    FavouriteArticleLocalDataSourceRef ref) {
  final Box<LocalArticleModel> localArticleModelBox =
      Hive.box('localArticleModelBox');
  return FavouriteArticleLocalDataSource(localArticleModelBox);
}

@riverpod
IFavouriteArticleRepository favouriteRepsository(FavouriteRepsositoryRef ref) {
  return FavouriteArticleRepositoryImpl(
      ref.watch(favouriteArticleLocalDataSourceProvider));
}

@riverpod
AddToFavouriteUseCase addToFavouriteUseCase(AddToFavouriteUseCaseRef ref) {
  return AddToFavouriteUseCase(
      favouriteArticleRepository: ref.watch(favouriteRepsositoryProvider));
}

@riverpod
RemoveFromFavouriteUseCase removeFromFavouriteUseCase(
    RemoveFromFavouriteUseCaseRef ref) {
  return RemoveFromFavouriteUseCase(
      favouriteArticleRepository: ref.watch(favouriteRepsositoryProvider));
}

@riverpod
GetFavouriteArticleUseCase getFavouriteArticleUseCase(
    GetFavouriteArticleUseCaseRef ref) {
  return GetFavouriteArticleUseCase(
      favouriteArticleRepository: ref.watch(favouriteRepsositoryProvider));
}

//!---------Value Type Providers---------

//?---------Notifier Type Providers---------
@Riverpod(keepAlive: true)
class FavouriteNotifier extends _$FavouriteNotifier {
  @override
  FavouriteState build() {
    getFavouriteArticles();
    return FavouriteState(articles: {}, status: FavouriteStateStatus.success);
  }

  void getFavouriteArticles() async {
    final val = await ref.read(getFavouriteArticleUseCaseProvider)(NoParams());
    if (val != null) {
      state = FavouriteState(
          articles: val.toSet(), status: FavouriteStateStatus.success);
    } else {
      state =
          FavouriteState(articles: {}, status: FavouriteStateStatus.failure);
    }
  }

  void addToFavourite(ArticleEntity articleEntity) async {
    if (!state.articles.contains(articleEntity)) {
      state = FavouriteState(
          articles: {...state.articles, articleEntity},
          status: FavouriteStateStatus.success);
    }
    ref.read(addToFavouriteUseCaseProvider)(articleEntity);
    getFavouriteArticles();

  }

  void removeFromFavourite(ArticleEntity articleEntity,int index) {
    if (state.articles.contains(articleEntity)) {
      state = FavouriteState(
          articles: (state.articles
              .where((p) => p.articleId != articleEntity.articleId)
              .toSet()),
          status: FavouriteStateStatus.success);
    }
    ref.read(removeFromFavouriteUseCaseProvider)(index);
    getFavouriteArticles();
  }
}
//?---------Notifier Type Providers---------
