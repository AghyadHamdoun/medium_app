class Article {
  final String id;
  final String title;
  final String content;
  final String shortDescription;
  final String imageUrl;
  final String authorImageUrl;
  final String author;
  final DateTime date;
  final int likes;
  final List<String> comments;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.shortDescription,
    required this.imageUrl,
    required this.authorImageUrl,
    required this.date,
    required this.likes,
    required this.comments,
  });
}
