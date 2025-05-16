import 'package:flutter/material.dart';
import 'package:DevLogger/features/articleDetails/presentaion/ui/screens/article_details_screen.dart';

import '../../../../../articleDetails/data/models/article_model.dart';
import 'medium_article_card.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return MediumArticleCard(
          title: articles[index].title,
          imageUrl: articles[index].imageUrl,
          authorImageUrl: articles[index].authorImageUrl,
          author: articles[index].author,
          // Assuming you have an author field
          datePublished: articles[index].date.toString().substring(0, 10),
          // Assuming you have a datePublished field
          description: articles[index].content,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ArticleDetailsScreen(articleId: articles[index].id)));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
