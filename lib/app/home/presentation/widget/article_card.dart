import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/app/favourite/presentation/provider/favourite_provider.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/app/home/presentation/provider/home_provider.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class ArticleCard extends ConsumerWidget {
  final ArticleEntity article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);
    final favouriteState = ref.watch(favouriteNotifierProvider);
    return InkWell(
      onTap: () {
        context.router.push(ArticleDetailRoute(article: article));
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      article.imageUrl ?? 'https://via.placeholder.com/150',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/placeholder.jpeg',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: favouriteState.articles.contains(article)
                          ? Colors.red.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                      child: IconButton(
                        icon: Icon(
                          favouriteState.articles.contains(article)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favouriteState.articles.contains(article)
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          // _toggleLike();
                          ref
                              .read(favouriteNotifierProvider.notifier)
                              .addToFavourite(article);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                article.title,
                style: context.textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              if (article.description != null &&
                  article.description!.isNotEmpty)
                Text(
                  article.description!,
                  style: context.textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 8.0),
              Text(
                article.pubDate ?? '',
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
