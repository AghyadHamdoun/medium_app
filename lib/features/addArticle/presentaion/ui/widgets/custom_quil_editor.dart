import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class QuillEditorWithHint extends StatefulWidget {
  final quill.QuillController controller;
  final String hintText;
  final FocusNode focusNode;

  const QuillEditorWithHint({super.key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
  });

  @override
  QuillEditorWithHintState createState() => QuillEditorWithHintState();
}

class QuillEditorWithHintState extends State<QuillEditorWithHint> {
  bool  isEditorEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkEditorContent);
    isEditorEmpty = widget.controller.document.toPlainText().trim().isEmpty;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkEditorContent);
    super.dispose();
  }

  void _checkEditorContent() {
    final isEmpty = widget.controller.document.toPlainText().trim().isEmpty;
    if (isEmpty != isEditorEmpty) {
      setState(() {
        isEditorEmpty = isEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        quill.QuillEditor.basic(
          configurations: quill.QuillEditorConfigurations(
            controller: widget.controller,
          ),

          focusNode: widget.focusNode,
        ),
        if (isEditorEmpty)
          IgnorePointer(
            child: Container(
              color: Colors.transparent,
              child: Text(
                widget.hintText,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}