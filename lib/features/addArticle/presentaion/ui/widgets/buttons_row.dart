import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:DevLogger/core/constant/my_converter.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_bloc.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_event.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_state.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:DevLogger/core/theme/app_color.dart';

import '../../../../chat/chat_page.dart';

class ButtonRow extends StatefulWidget {
  final QuillController quillController;

  const ButtonRow({super.key, required this.quillController});

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  final gemini = Gemini.instance;

  String _convertDeltaToHtml(Delta delta) {
    final converter = QuillDeltaToHtmlConverter(
        delta.toList().map((op) => op.toJson()).toList(),
        ConverterOptions.forEmail());
    return converter.convert();
  }

  String _getDocumentAsHtml() {
    final delta = widget.quillController.document.toDelta();
    return _convertDeltaToHtml(delta);
  }

  String _getSelectedTextAsHtml() {
    final selection = widget.quillController.selection;
    if (selection.isCollapsed) {
      return ''; // No text is selected
    } else {
      final selectedDelta = widget.quillController.document
          .toDelta()
          .slice(selection.start, selection.end);
      return _convertDeltaToHtml(selectedDelta);
    }
  }

  void _replaceSelectedTextWithHtml(String htmlText) {
    final delta = HtmlToDeltaConverter.htmlToDelta(htmlText);

    final selection = widget.quillController.selection;
    if (selection.isCollapsed) {
      return; // No text is selected
    } else {
      widget.quillController.replaceText(
        selection.start,
        selection.end - selection.start,
        delta,
        TextSelection.collapsed(offset: selection.start + delta.length),
      );
    }
  }


  void askGemini(BuildContext context, String customText) {
    String response;
    var htmlText = _getSelectedTextAsHtml();
    if (htmlText.isEmpty) {
      BotToast.showText(text: "Select text first");
      return;
    }
    context.read<AddArticleBloc>().add(const ShowLoadingEvent());
    gemini
        .text(customText + htmlText)
        .then((value) {
      context.read<AddArticleBloc>().add(const ShowLoadingEvent());
      print(value!.output);
      response = value.output!;
      _replaceSelectedTextWithHtml(response);
    })
        .catchError((e) {
      context.read<AddArticleBloc>().add(const ShowLoadingEvent());
      BotToast.showText(text: e.toString());
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [


          ///[Ask Ai] ------
          ElevatedButton.icon(
            onPressed: () {
              // Action for Ask AI button
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Ask AI'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.blackColor, // Button color
              backgroundColor: Colors.white, // Text color
              side: const BorderSide(
                color: Colors.grey, // لون الحدود
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8.0), // نصف قطر الحواف الدائرية
              ),
            ),
          ),
          10.horizontalSpace,

          ///[translate] ------
          PopupMenuButton<String>(
            onSelected: (value) {
              // Action for selected menu item
              switch (value) {
                case 'English':
                  askGemini(context, 'Translate the following text to english'
                      'return the result in html in result property :');
                  break;
                case 'Arabic':
                  askGemini(context, 'Translate the following text  to Arabic'
                      'return the result in html in result property :');
                  break;
                case 'French':

                  askGemini(context, 'Translate the following text  to french '
                      'return the result in html in result property :');
                  break;
                case 'German':
                  askGemini(context, 'Translate the following text to german '
                      'return the result in html in result property :');
                  break;
              }
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'English',
                child: Text('To English'),
              ),
              const PopupMenuItem<String>(
                value: 'Arabic',
                child: Text('To Arabic'),
              ),
              const PopupMenuItem<String>(
                value: 'French',
                child: Text('To French'),
              ),
              const PopupMenuItem<String>(
                value: 'German',
                child: Text('To German'),
              ),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 7.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.translate,
                    color: Colors.black, // لون الأيقونة
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.black, // لون النص
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.horizontalSpace,

          ///[Text Correction] ------
          PopupMenuButton<String>(
            onSelected: (value) {
              // Action for selected menu item
              switch (value) {
                case 'spelling':
                // Handle Spelling Correction
                  askGemini(context, 'Please correct any spelling mistakes in the following text '
                      'return the result in html in result property :');
                  break;
                case 'punctuation':
                // Handle Punctuation Correction

                  askGemini(context, 'Please correct any punctuation and capitalization mistakes in the following text '
                      'return the result in html in result property :');
                  break;
                case 'grammar':
                // Handle Grammar and Tense Correction

                  askGemini(context, 'Please correct any  grammatical errors and verb tense  mistakes in the following text '
                      'return the result in html in result property :');
                  break;
                case 'all':
                // Handle Correct All Issues

                  askGemini(context, 'Please correct any  spelling mistakes, punctuation errors, capitalization errors, and grammatical errors (including verb tense) mistakes in the following text '
              'return the result in html in result property :');
                  break;
              }
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'spelling',
                child: Text('Spelling Correction'),
              ),
              const PopupMenuItem<String>(
                value: 'punctuation',
                child: Text('Punctuation Correction'),
              ),
              const PopupMenuItem<String>(
                value: 'grammar',
                child: Text('Grammar and Tense Correction'),
              ),
              const PopupMenuItem<String>(
                value: 'all',
                child: Text('Correct All Issues'),
              ),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 7.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.auto_fix_high,
                    color: Colors.black, // لون الأيقونة
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Text Correction',
                    style: TextStyle(
                      color: Colors.black, // لون النص
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.horizontalSpace,

          ///[Auto Complete] ------
          ElevatedButton.icon(
            onPressed: () {
              askGemini(context, ' return the text in html in result property\n'
                  'Suggest about 5 to 10 lines as a completion for the following text : '
                  );
              // Action for Auto Complete button

            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Auto Complete'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.blackColor, // Button color
              backgroundColor: Colors.white, // Text color
              side: const BorderSide(
                color: Colors.grey, // لون الحدود
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8.0), // نصف قطر الحواف الدائرية
              ),
            ),
          ),
          10.horizontalSpace,


          ///[Reformat] ------
          ElevatedButton.icon(
            onPressed: () {
              askGemini(context, 'Format the text appropriately for placement in an article'
                  'return the result in html in result property :');
            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Reformat'),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.blackColor, // Button color
              backgroundColor: Colors.white, // Text color
              side: const BorderSide(
                color: Colors.grey, // لون الحدود
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8.0), // نصف قطر الحواف الدائرية
              ),
            ),
          ),

        ],
      ),
    );
  }
}
