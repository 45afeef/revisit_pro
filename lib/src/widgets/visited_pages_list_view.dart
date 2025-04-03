import 'package:flutter/material.dart';

import '../models/visited_page.dart';
import '../storage/visited_pages_storage.dart';

typedef ItemBuilder = Widget Function(BuildContext context, VisitedPage page);

class VisitedPagesListView extends StatelessWidget {
  final ItemBuilder itemBuilder;
  final bool showMostVisited;
  final bool showRecentlyOpened;
  final double decayRate;

  const VisitedPagesListView({
    super.key,
    required this.itemBuilder,
    this.showMostVisited = true,
    this.showRecentlyOpened = true,
    this.decayRate = 0.01,
  });

  @override
  Widget build(BuildContext context) {
    final mostVisited = showMostVisited
        ? VisitedPagesStorage.getMostVisitedPages(decayRate: decayRate)
        : [];
    final recentlyOpened =
        showRecentlyOpened ? VisitedPagesStorage.getRecentlyOpenedPages() : [];

    return ListView(
      children: [
        if (showMostVisited) ...[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Most Visited Pages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...mostVisited.map((page) => itemBuilder(context, page.key)),
        ],
        if (showRecentlyOpened) ...[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Recently Opened Pages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...recentlyOpened.map((page) => itemBuilder(context, page)),
        ],
      ],
    );
  }
}
