import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kliq_news_app/app/home/data/data_source/remote/home_api_service.dart';
import 'package:kliq_news_app/app/home/data/model/news_article_model/article_model.dart';
import 'package:kliq_news_app/app/home/data/model/news_article_model/news_article_model.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/app/home/domain/repository/home_repository.dart';
import 'package:kliq_news_app/core/resources/data_state.dart';
import 'package:retrofit/dio.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final HomeApiService homeApiService;

  HomeRepositoryImpl({required this.homeApiService});
  @override
  Future<DataState<List<ArticleModel>>> getLatestArticles() async {
    try {
      final HttpResponse response = await homeApiService.getLatestArticles(
          //apikey: AppConstants.newsApiKey
          );
      if (response.response.statusCode == HttpStatus.ok) {
        final NewsArticleModel model = response.data;
        final List<ArticleModel> articleModelList = model.results;
        return DataSuccess(articleModelList);
      } else {
        return DataFailed(DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ArticleEntity>>> getArchiveArticles() {
    // TODO: implement getArchiveArticles
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<ArticleEntity>>> getCryptoArticles() {
    // TODO: implement getCryptoArticles
    throw UnimplementedError();
  }
}
