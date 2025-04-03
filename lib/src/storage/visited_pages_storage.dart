import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/visited_page.dart';

class VisitedPagesStorage {
  static const String _boxName = 'visited_pages';

  static List<MapEntry<VisitedPage, num>> getMostVisitedPages(
      {double decayRate = 0.01}) {
    final now = DateTime.now();
    return _getBox().values.map((page) {
      final age = now.difference(page.lastVisited).inDays;
      final score = (page.visitCount * page.totalTimeSpent) *
          (age > 0 ? (1 / (1 + decayRate * age)) : 1);
      return MapEntry(page, score);
    }).toList()
      ..sort((a, b) => b.value.compareTo(a.value))
      ..map((e) => e.key)
      ..toList();
  }

  static List<VisitedPage> getRecentlyOpenedPages() {
    return _getBox().values.toList()
      ..sort((a, b) => b.lastVisited.compareTo(a.lastVisited));
  }

  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    Hive.registerAdapter(VisitedPageAdapter());
    await Hive.openBox<VisitedPage>(_boxName);
  }

  static Future<void> resetTrackingData() async {
    await _getBox().clear();
  }

  static Future<void> savePageVisit(
      String pageName, String category, String url, int timeSpent) async {
    var box = _getBox();
    var existingPage = box.values.firstWhere(
      (page) => page.url == url,
      orElse: () =>
          VisitedPage(pageName: pageName, category: category, url: url),
    );

    existingPage.incrementVisit(timeSpent);
    await box.put(url, existingPage);
  }

  static Box<VisitedPage> _getBox() => Hive.box<VisitedPage>(_boxName);
}
