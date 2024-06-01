import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

abstract class IFavouriteArticleRepository {
  Future<List<ArticleEntity>?> getLocalArticleModels();
  Future<void> addLocalArticleModel(ArticleEntity localArticleModel);
  Future<void> deleteLocalArticleModel(int index);
}
