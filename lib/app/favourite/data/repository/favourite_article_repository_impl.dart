import 'package:kliq_news_app/app/favourite/data/data_source/local_data_source.dart';
import 'package:kliq_news_app/app/favourite/data/model/local_article_model.dart';
import 'package:kliq_news_app/app/favourite/domain/repository/favourite_article_repository.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';

class FavouriteArticleRepositoryImpl implements IFavouriteArticleRepository {
  final FavouriteArticleLocalDataSource localDataSource;

  FavouriteArticleRepositoryImpl(this.localDataSource);

  @override
  Future<void> addLocalArticleModel(ArticleEntity articleEntity) async {
    final LocalArticleModel articleModel =
        LocalArticleModel.fromEntity(articleEntity);
    localDataSource.addLocalArticleModel(articleModel);
  }

  @override
  Future<void> deleteLocalArticleModel(int index) async {
    localDataSource.deleteLocalArticleModel(index);
  }

  @override
  Future<List<ArticleEntity>?> getLocalArticleModels() async {
    try {
      final List<LocalArticleModel> localArticles =
          localDataSource.getLocalArticleModels();
      List<ArticleEntity> res =
          localArticles.map((model) => model.toEntity()).toList();
      return res;
    } catch (error) {
      return [];
    }
  }
}
