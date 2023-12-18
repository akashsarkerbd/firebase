import 'package:firebase_test/ui/models/match.dart';
import 'package:flutter/material.dart';

class MatchDetailScreen extends StatefulWidget {
  final Matches match;

  const MatchDetailScreen({
    super.key,
    required this.match,
  });

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.match.name
          // widget.match.name,
          //style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.match.name,
                    style: Theme.of(context).textTheme.titleLarge),
                Text(widget.match.goal,
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 8),
                Text('time: ${widget.match.time}'),
                Text('Total Time: ${widget.match.totalTime}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
