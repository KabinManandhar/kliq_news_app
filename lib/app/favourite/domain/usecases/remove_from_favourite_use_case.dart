import 'package:kliq_news_app/app/favourite/domain/repository/favourite_article_repository.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';

class RemoveFromFavouriteUseCase implements UseCase<void, int> {
  final IFavouriteArticleRepository favouriteArticleRepository;

  RemoveFromFavouriteUseCase({required this.favouriteArticleRepository});
  @override
  Future<void> call(int articleEntityIndex) async {
    return await favouriteArticleRepository
        .deleteLocalArticleModel(articleEntityIndex);
  }
}
