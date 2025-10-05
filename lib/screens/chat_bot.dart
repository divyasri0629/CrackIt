
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotWidget extends StatefulWidget {
  final String apiKey;
  final VoidCallback onClose;

  const ChatBotWidget({super.key, required this.apiKey, required this.onClose});

  @override
  State<ChatBotWidget> createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool isThinking = false;

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
      isThinking = true;
    });
    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.apiKey}',
          'X-Title': 'InterviewChatBot',
        },
        body: jsonEncode({
          'model': 'deepseek/deepseek-chat-v3-0324:free',
          'messages': [
            {'role': 'system', 'content': 'You are a helpful assistant for job interview preparation.'},
            ..._messages,
          ],
          'max_tokens': 200,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiMessage = data['choices'][0]['message']['content'];
        setState(() {
          _messages.add({'role': 'assistant', 'content': aiMessage});
          isThinking = false;
        });
      } else {
        setState(() {
          _messages.add({'role': 'assistant', 'content': '❌ Error: ${response.statusCode}'});
          isThinking = false;
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({'role': 'assistant', 'content': '⚠ Network error: $e'});
        isThinking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 213, 201, 223),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ChatBot', style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length + (isThinking ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (isThinking && index == _messages.length) {
                      return const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("🤖 Thinking..."),
                        ),
                      );
                    }
                    final message = _messages[index];
                    final isUser = message['role'] == 'user';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser
                              ? const Color(0xFFC8BAD3)
                              : Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(message['content']!),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: 'Ask something...'),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
