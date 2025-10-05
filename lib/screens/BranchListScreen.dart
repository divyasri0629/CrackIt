import 'package:flutter/material.dart';
import '../data/question_data.dart';
import 'mcq_list_screen.dart';

class BranchListScreen extends StatelessWidget {
  const BranchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final branches = [
      {'name': 'CSE', 'data': cseMcqData},
      {'name': 'ECE', 'data': eceMcqData},
      {'name': 'AIML', 'data': aimlMcqData},
      {'name': 'DS', 'data': dsMcqData},
      {'name': 'MECH', 'data': mechMcqData},
      {'name': 'CIVIL', 'data': civilMcqData},
    ];

    final List<Color> colors = [
      Color.fromARGB(255, 213, 235, 246), // Light Blue
      Color.fromARGB(255, 255, 250, 209), // Light Yellow
      Color.fromARGB(255, 220, 240, 220), // Light Green
      Color.fromARGB(255, 245, 223, 217), // Light Orange
      Color.fromARGB(255, 230, 223, 243), // Light Purple
      Color.fromARGB(255, 249, 222, 224), // Light Pink
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Branch'),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFEADADE),
      ),
      body: ListView.builder(
        itemCount: branches.length,
        itemBuilder: (context, index) {
          final branch = branches[index];
          final color = colors[index % colors.length];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => McqListScreen(
                    title: branch['name'] as String,
                    mcqList: branch['data'] as List<Map<String, dynamic>>,
                  ),
                ),
              );
            },
            child: Container(
              height: 100,
              width: 250,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  branch['name'] as String,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}