import 'package:flutter/material.dart';
import 'package:crackit/screens/single_screen.dart';


class CompanyCard extends StatefulWidget {
  final Map<String, dynamic> company;
  final bool isDark;
  final VoidCallback onToggleTheme;

  const CompanyCard({super.key, required this.company, required this.isDark,
    required this.onToggleTheme,});

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(15),topRight: Radius.circular(15)
            ),
            child: Image.network(
              widget.company['imageurl'] ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Learn the ${widget.company['title']} \ninterview rounds',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleCompanyScreen(
                          title: "About ${widget.company['title']}",
                          imageurl: widget.company['imageurl'] ?? '',
                          content: widget.company['content'] ?? 'No information available.',
                          stitle: widget.company['stitle'] ?? widget.company['title'] ?? '',
                          rounds: widget.company['rounds'],
                          address: widget.company['address'],
                          isDark: widget.isDark,
                          onToggleTheme: widget.onToggleTheme,
                        ),
                      ),
                    );
                  },
                  child: const Text('Enter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 