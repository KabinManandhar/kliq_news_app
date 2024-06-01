import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/core/resources/data_state.dart';

abstract class IHomeRepository {
  Future<DataState<List<ArticleEntity>>> getLatestArticles();
  Future<DataState<List<ArticleEntity>>> getCryptoArticles();
  Future<DataState<List<ArticleEntity>>> getArchiveArticles();
}
