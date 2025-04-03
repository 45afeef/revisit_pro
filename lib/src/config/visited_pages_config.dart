class VisitedPagesConfig {
  static double decayRate = 0.01;
  static final Set<String> _excludedPages = {};

  static void setDecayRate(double rate) {
    decayRate = rate;
  }

  static void excludePages(List<String> pages) {
    _excludedPages.addAll(pages);
  }

  static bool isExcluded(String url) {
    return _excludedPages.contains(url);
  }
}
