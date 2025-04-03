import '../config/visited_pages_config.dart';
import '../storage/visited_pages_storage.dart';

class PageTracker {
  static String? _currentPage;
  static DateTime? _startTime;

  static void startTracking(String pageName, String category, String url) {
    if (VisitedPagesConfig.isExcluded(url)) return;

    _currentPage = url;
    _startTime = DateTime.now();
  }

  static Future<void> stopTracking() async {
    if (_currentPage == null || _startTime == null) return;

    final timeSpent = DateTime.now().difference(_startTime!).inSeconds;
    await VisitedPagesStorage.savePageVisit(
        _currentPage!, "", _currentPage!, timeSpent);

    _currentPage = null;
    _startTime = null;
  }
}
