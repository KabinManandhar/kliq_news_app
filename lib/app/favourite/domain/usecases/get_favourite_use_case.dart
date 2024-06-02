import 'package:kliq_news_app/app/favourite/domain/repository/favourite_article_repository.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';

class GetFavouriteArticleUseCase
    implements UseCase<List<ArticleEntity>?, NoParams> {
  final IFavouriteArticleRepository favouriteArticleRepository;

  GetFavouriteArticleUseCase({required this.favouriteArticleRepository});
  @override
  Future<List<ArticleEntity>?> call(NoParams _) async {
    return await favouriteArticleRepository.getLocalArticleModels();
  }
}
