import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/app/home/domain/repository/home_repository.dart';
import 'package:kliq_news_app/core/resources/data_state.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';

class GetLatestNewsArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, NoParams> {
  final IHomeRepository homeRepository;

  GetLatestNewsArticlesUseCase({required this.homeRepository});
  @override
  Future<DataState<List<ArticleEntity>>> call(NoParams _) async {
    return homeRepository.getLatestArticles();
  }
}
