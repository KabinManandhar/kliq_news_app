import 'package:kliq_news_app/app/favourite/domain/repository/favourite_article_repository.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';

class AddToFavouriteUseCase implements UseCase<void, ArticleEntity> {
  final IFavouriteArticleRepository favouriteArticleRepository;

  AddToFavouriteUseCase({required this.favouriteArticleRepository});
  @override
  Future<void> call(ArticleEntity articleEntity) async {
    return await favouriteArticleRepository.addLocalArticleModel(articleEntity);
  }
}
