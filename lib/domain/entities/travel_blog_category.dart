class TravelBlogCategory {
  static const String all = 'all';
  static const String adventure = 'adventure';
  static const String food = 'food';
  static const String nature = 'nature';
  static const String relaxation = 'relaxation';

  static const List<String> values = [all, adventure, food, nature, relaxation];

  static String label(String cat) {
    switch (cat) {
      case adventure:
        return 'Adventure';
      case food:
        return 'Food';
      case nature:
        return 'Nature';
      case relaxation:
        return 'Relaxation';
      default:
        return 'All';
    }
  }
}
