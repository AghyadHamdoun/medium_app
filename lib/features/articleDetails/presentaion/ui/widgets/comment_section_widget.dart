import 'package:flutter/material.dart';

import '../../../data/models/article_model.dart';

class CommentSection extends StatefulWidget {
  final Article article;

  const CommentSection({super.key, required this.article});

  @override
   createState() => CommentSectionState();
}

class CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        widget.article.comments.add(_commentController.text);
      });
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        TextField(
        controller: _commentController,
        decoration: InputDecoration(
        labelText: 'Add a comment',
        suffixIcon: IconButton(
        icon: Icon(Icons.send),
          onPressed: _addComment,
        ),
        ),
        ),
          Expanded(
            child: ListView(
              children: widget.article.comments.map((comment) {
                return ListTile(
                  title: Text(comment),
                );
              }).toList(),
            ),
          ),
        ],
    );
  }
}
