import 'package:kliq_news_app/app/home/data/data_source/remote/home_api_service.dart';
import 'package:kliq_news_app/app/home/data/repository/home_repository_impl.dart';
import 'package:kliq_news_app/app/home/domain/repository/home_repository.dart';
import 'package:kliq_news_app/app/home/domain/usecases/get_latest_news_articles_usecase.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_states.dart';
import 'package:kliq_news_app/core/resources/data_state.dart';
import 'package:kliq_news_app/core/resources/services/remote/dio_network_service_provider.dart';
import 'package:kliq_news_app/core/resources/use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

//!---------Value Type Providers---------
@riverpod
HomeApiService homeAPIService(HomeAPIServiceRef ref) {
  ref.watch(networkServiceProvider);
  return HomeApiService(ref.watch(networkServiceProvider));
}

@riverpod
IHomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl(homeApiService: ref.watch(homeAPIServiceProvider));
}

@riverpod
GetLatestNewsArticlesUseCase getNewsArticleUseCase(
    GetNewsArticleUseCaseRef ref) {
  return GetLatestNewsArticlesUseCase(
      homeRepository: ref.watch(homeRepositoryProvider));
}

//!---------Value Type Providers---------

//?---------Notifier Type Providers---------
@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    getLatestArticles();
    return HomeState(articles: {}, status: HomeStateStatus.loading);
  }

 

  Future<void> getLatestArticles() async {
    state = state.copyWith(status: HomeStateStatus.loading);
    final val = await ref.read(getNewsArticleUseCaseProvider)(NoParams());
    if (val is DataSuccess && val.data != null) {
      state = HomeState(
          articles: val.data!.toSet(), status: HomeStateStatus.success);
    } else if (val is DataFailed) {
      state = HomeState(articles: {}, status: HomeStateStatus.failure);
    }
  }
}
//?---------Notifier Type Providers---------