import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:DevLogger/core/theme/app_color.dart';
import 'package:DevLogger/features/chat/widgets/chat_bubble.dart';

const apiKey = 'AIzaSyDdNIZblXkXrVqRBPEsPXb8QfKW1a4PrB0';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  TextEditingController messageController = TextEditingController();

  bool isLoading = false;

  List<ChatBubble> chatBubbles = [
    const ChatBubble(
      direction: Direction.left,
      message: 'Hello, I am GEMINI AI. How can I assist you?',
      sender: false,
      photoUrl: 'https://img.freepik.com/free-vector/graident-ai-robot-vectorart_78370-4114.jpg',
      type: BubbleType.alone,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('DevLogger Ai Assistant',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.blackColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              reverse: true,
              padding: const EdgeInsets.all(10),
              children: chatBubbles.reversed.toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    if (messageController.text.isEmpty) return;

                    setState(() {
                      isLoading = true;

                      // Add user's message to the chat
                      chatBubbles.add(
                        ChatBubble(
                          direction: Direction.right,
                          message: messageController.text,
                          photoUrl: null,
                          type: BubbleType.alone, sender: true,
                        ),
                      );
                    });

                    // Store the user's message
                    final content = [Content.text(messageController.text)];

                    // Clear the message input
                    messageController.clear();

                    // Generate AI response
                    final GenerateContentResponse responseAI =
                    await model.generateContent(content);

                    // Add AI response to the chat
                    chatBubbles.add(
                      ChatBubble(
                        direction: Direction.left,
                        message: responseAI.text ??
                            'Sorry, I didn\'t understand that.',
                        photoUrl: 'https://img.freepik.com/free-vector/graident-ai-robot-vectorart_78370-4114.jpg',
                        type: BubbleType.alone, sender: false,
                      ),
                    );

                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
