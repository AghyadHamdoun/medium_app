import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:DevLogger/core/theme/app_color.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_bloc.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_state.dart';
import 'package:DevLogger/features/preview/preview_screen.dart';
import 'package:DevLogger/injection.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

import '../widgets/buttons_row.dart';
import '../widgets/custom_quil_editor.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({super.key});

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  late QuillController _controller;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  late FocusNode editorFocusNode;

  File? _selectedImage;
  List<dynamic>? _selectedTags = [];
  final List<MultiSelectItem> _availableTags = [
    MultiSelectItem(0, 'Technology'),
    MultiSelectItem(1, 'Programming'),
    MultiSelectItem(2, 'Flutter'),
    MultiSelectItem(3, 'Android'),
    MultiSelectItem(4, 'iOS'),
    MultiSelectItem(5, 'Web Development'),
    MultiSelectItem(6, 'Design'),
    MultiSelectItem(7, 'UI/UX'),
    MultiSelectItem(8, 'Backend Development'),
    MultiSelectItem(9, 'Frontend Development'),
    MultiSelectItem(10, 'Full Stack Development'),
    MultiSelectItem(11, 'DevOps'),
    MultiSelectItem(12, 'Cloud Computing'),
    MultiSelectItem(13, 'Databases'),
    MultiSelectItem(14, 'API Development'),
    MultiSelectItem(15, 'Testing'),
    MultiSelectItem(16, 'Quality Assurance'),
    MultiSelectItem(17, 'Java'),
    MultiSelectItem(18, 'Kotlin'),
    MultiSelectItem(19, 'Swift'),
    MultiSelectItem(20, 'JavaScript'),
    MultiSelectItem(21, 'Python'),
    MultiSelectItem(22, 'C++'),
    MultiSelectItem(23, 'C#'),
    MultiSelectItem(24, 'React'),
    MultiSelectItem(25, 'Angular'),
    MultiSelectItem(26, 'Vue.js'),
    MultiSelectItem(27, 'Node.js'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
    editorFocusNode = FocusNode();
  }
  String _getDocumentAsHtml() {
    final delta = _controller.document.toDelta();
    return _convertDeltaToHtml(delta);
  }
  String _convertDeltaToHtml(Delta delta) {
    final converter = QuillDeltaToHtmlConverter(
        delta.toList().map((op) => op.toJson()).toList(),
        ConverterOptions.forEmail());
    return converter.convert();
  }

  Future<void> _showTagDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Padding(
            padding:  REdgeInsets.symmetric(vertical: 10.0),
            child: MultiSelectChipField(
            scroll: false,
              searchable: true,
              selectedChipColor: Colors.black,
              selectedTextStyle: TextStyle(
                color: Colors.white
              ),
              chipColor: Colors.black,
              textStyle:TextStyle(
                  color: Colors.white
              ) ,
              icon: Icon(Icons.check,color: Colors.white),


              items: _availableTags,
              onTap: (selectedList) {
                setState(() {
                  _selectedTags = selectedList;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit?'),
        content: Text('Do you want to leave this page?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    var bloc = sl<AddArticleBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<AddArticleBloc, AddArticleState>(
        bloc: bloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(children: [
            Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.close, color: AppColor.blackColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedImage == null || _titleController.text.isEmpty  ) {
                        BotToast.showText(text: "Please add image and title");
                      }  else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PreviewScreen(title: _titleController.text, articleImage: _selectedImage!, htmlData:_getDocumentAsHtml())));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Preview',
                      style: TextStyle(color: Colors.white, fontSize:12 ),
                    ),
                  ),
                  5.horizontalSpace,
                  PopupMenuButton<String>(
                    iconColor: AppColor.blackColor,
                    onSelected: (String item) {
                      switch (item) {
                        case 'edit':

                          break;
                        case 'delete':
                          // TODO: Implement delete functionality
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Post'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: _selectedImage != null
                            ? Image.file(_selectedImage!, fit: BoxFit.cover)
                            : const Center(
                                child: Text(
                                'Tap to select cover image',
                                style: TextStyle(color: AppColor.hintText),
                              )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _titleController,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              hintText: 'Enter article title',
                              hintStyle: TextStyle(
                                  color: AppColor.hintText, fontSize: 20),
                              border: InputBorder.none, // Remove underline
                            ),
                          ),
                          TextField(
                            controller: _summaryController,
                            decoration: const InputDecoration(
                              hintText: 'Enter article summary',
                              hintStyle: TextStyle(color: AppColor.hintText),
                              border: InputBorder.none, // Remove underline
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _showTagDialog,
                            child: const Text(
                              'Select Tags',
                              style: TextStyle(color: AppColor.blueColor),
                            ),
                          ),
                          MultiSelectChipDisplay(
                            items: _selectedTags
                                ?.map((tag) => MultiSelectItem(
                              tag,
                              _availableTags
                                  .firstWhere((element) => element.value == tag)
                                  .label,
                            ))
                                .toList() ??
                                [],
                            chipColor: Colors.grey.shade100, // White chip color
                            textStyle: TextStyle(color: Colors.black), // Black text color
            scroll: false,

                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ButtonRow(
                            quillController: _controller,
                          ),
                          10.verticalSpace,
                          QuillToolbar.simple(
                            configurations: QuillSimpleToolbarConfigurations(
                              controller: _controller,
                              showAlignmentButtons: false,
                              showBackgroundColorButton: false,
                              showColorButton: true,
                              showCodeBlock: true,
                              showDirection: false,
                              showDividers: false,
                              showFontFamily: false,
                              showFontSize: true,
                              showHeaderStyle: false,
                              showIndent: false,
                              showInlineCode: false,
                              showLink: true,
                              showListBullets: true,
                              showListCheck: false,
                              showListNumbers: false,
                              showQuote: true,
                              showSearchButton: false,
                              showStrikeThrough: false,
                              showUnderLineButton: false,
                              showClipboardCopy: false,
                              showClipboardCut: false,
                              showClipboardPaste: false,
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(minHeight: 400),
                              child: QuillEditorWithHint(
                                controller: _controller,
                                hintText: 'Enter your text here...',
                                focusNode: editorFocusNode,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.showLoading == true)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Semi-transparent black color
                ),
              ),
            if (state.showLoading == true)
            Center(child: Lottie.asset('assets/images/loading1.json')),
          ]);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _summaryController.dispose();
    super.dispose();
  }
}
