import 'package:dio/dio.dart';
import 'package:kliq_news_app/app/home/data/model/news_article_model/news_article_model.dart';
import 'package:kliq_news_app/core/global/constants/app_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('latest')
  Future<HttpResponse<NewsArticleModel>> getLatestArticles();

  @GET('crypto')
  Future<HttpResponse<NewsArticleModel>> geCryptoArticles();

  @GET('archive')
  Future<HttpResponse<NewsArticleModel>> getArchiveArticles();
}
