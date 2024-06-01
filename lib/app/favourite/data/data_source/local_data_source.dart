import 'package:hive/hive.dart';
import 'package:kliq_news_app/app/favourite/data/model/local_article_model.dart';

class FavouriteArticleLocalDataSource {
  final Box<LocalArticleModel> localArticleModelBox;

  FavouriteArticleLocalDataSource(this.localArticleModelBox);

  List<LocalArticleModel> getLocalArticleModels() {
    return localArticleModelBox.values.toList();
  }

  void addLocalArticleModel(LocalArticleModel localArticleModel) {
    localArticleModelBox.add(localArticleModel);
  }

  void deleteLocalArticleModel(int index) {
    localArticleModelBox.deleteAt(index);
  }
}
