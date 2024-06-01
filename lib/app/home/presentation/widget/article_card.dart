import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kliq_news_app/app/home/domain/entity/article_entity.dart';
import 'package:kliq_news_app/config/router/app_router.dart';
import 'package:kliq_news_app/core/resources/extensions/context_extension.dart';

class ArticleCard extends StatefulWidget {
  final ArticleEntity article;

  const ArticleCard({super.key, required this.article});

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ArticleDetailRoute(article: widget.article));
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
                      widget.article.imageUrl ??
                          'https://via.placeholder.com/150',
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
                      backgroundColor: isLiked
                          ? Colors.white.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                      child: IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: _toggleLike,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.article.title,
                style: context.textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              if (widget.article.description != null &&
                  widget.article.description!.isNotEmpty)
                Text(
                  widget.article.description!,
                  style: context.textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 8.0),
              Text(
                widget.article.pubDate ?? '',
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
