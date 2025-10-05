import 'package:flutter/material.dart';

class McqListScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> mcqList;

  const McqListScreen({
    super.key,
    required this.title,
    required this.mcqList,
  });

  @override
  State<McqListScreen> createState() => _McqListScreenState();
}

class _McqListScreenState extends State<McqListScreen> {
  final Map<int, bool> _expanded = {};
  final Map<int, String> _selectedOptions = {};

  final List<Color> pastelColors = [
    const Color(0xFFE1F1EE),
    const Color(0xFFE6E4F7),
    const Color(0xFFF3E9DC),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: widget.mcqList.length,
        itemBuilder: (context, index) {
          final mcq = widget.mcqList[index];
          final bgColor = pastelColors[index % pastelColors.length];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question
                  Text(
                    mcq['question'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Options
                  ...(mcq['options'] as List<dynamic>).map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedOptions[index],
                      onChanged: (value) {
                        setState(() {
                          _selectedOptions[index] = value!;
                        });
                      },
                      activeColor: Colors.black,
                      contentPadding: EdgeInsets.zero,
                    );
                  }),

                  // Show Answer Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          _expanded[index] == true
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.deepPurple,
                        ),
                        label: const Text(
                          'Show Answer',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        onPressed: () {
                          setState(() {
                            _expanded[index] = !(_expanded[index] ?? false);
                          });
                        },
                      ),
                    ],
                  ),

                  // Answer Text
                  if (_expanded[index] == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Answer: ${mcq['answer']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}