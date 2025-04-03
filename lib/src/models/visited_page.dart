import 'package:hive/hive.dart';

part 'visited_page.g.dart';

@HiveType(typeId: 0)
class VisitedPage extends HiveObject {
  @HiveField(0)
  final String pageName;

  @HiveField(1)
  final String category; // "collection" or "item"

  @HiveField(2)
  final String url; // URL of the page

  @HiveField(3)
  int visitCount;

  @HiveField(4)
  DateTime lastVisited;

  @HiveField(5)
  int totalTimeSpent; // in seconds

  VisitedPage({
    required this.pageName,
    required this.category,
    required this.url,
    this.visitCount = 0,
    DateTime? lastVisited,
    this.totalTimeSpent = 0,
  }) : lastVisited = lastVisited ?? DateTime.now();

  void incrementVisit(int timeSpent) {
    visitCount++;
    lastVisited = DateTime.now();
    totalTimeSpent += timeSpent;
  }
}
