import 'package:flutter/material.dart';
import 'BranchListScreen.dart';

class SingleCompanyScreen extends StatefulWidget {
  final String title;
  final String imageurl;
  final String content;
  final String stitle;
  final List<String> rounds;
  final String address;
  final bool isDark;
  final VoidCallback onToggleTheme;

  const SingleCompanyScreen({
    super.key,
    required this.title,
    required this.imageurl,
    required this.content,
    required this.stitle,
    required this.rounds,
    required this.address,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<SingleCompanyScreen> createState() => _SingleCompanyScreenState();
}

class _SingleCompanyScreenState extends State<SingleCompanyScreen> {
  // ignore: unused_field
  final bool _isfavourite = false;
  // ignore: unused_field
  final bool _showChat = false;
  final String openAIApiKey =
      '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';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Color(0xFFEADADE),

      appBar: AppBar(
        title: Text(widget.stitle, style: TextStyle(fontSize: 30)),
        backgroundColor: Color(0xFFC8BAD3),
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(BranchListScreen as BuildContext),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                      widget.isDark
                          ? Colors.grey[800]
                          : Colors.blueGrey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.imageurl,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fill,
                        errorBuilder:
                            (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(12),
                      color: widget.isDark ? Colors.grey[900] : Colors.blueGrey.shade200,
                    ),
                    child: Text(
                      widget.content,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Interview rounds List for ${widget.stitle} will appear here.',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isDark ? Colors.grey[900] : Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      itemCount: widget.rounds.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => ListTile(
                        leading: const Icon(Icons.check_circle_outline),
                        title: Text(widget.rounds[index]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("Location", style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.isDark ? Colors.grey[900] : Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      widget.address,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),


        ],
      ),
    );
  }
}