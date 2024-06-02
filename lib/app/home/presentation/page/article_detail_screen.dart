import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/core/global/page/base_page.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

@RoutePage()
class ArticleDetailPage extends StatelessWidget {
  final ArticleEntity article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      automaticallyImplyiLeading: true,
      titleText: (article.title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  article.imageUrl!,
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
            const SizedBox(height: 16.0),
            Text(
              article.title,
              style: context.textTheme.headlineSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Text(
              article.pubDate ?? '',
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 16.0),
            if (article.description != null && article.description!.isNotEmpty)
              Text(
                article.description!,
                style: context.textTheme.bodyLarge,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 16.0),
            Text(
              article.content ?? 'No content available',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
