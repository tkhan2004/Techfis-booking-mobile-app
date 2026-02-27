class SearchCategory {
  static const String all = 'all';
  static const String popular = 'popular';
  static const String luxury = 'luxury';
  static const String destination = 'destination';
  static const String promotion = 'promotion';

  static const List<String> values = [
    all,
    popular,
    luxury,
    destination,
    promotion,
  ];

  static String label(String cat) {
    switch (cat) {
      case popular:
        return 'Popular';
      case luxury:
        return 'Luxury';
      case destination:
        return 'Top Destination';
      case promotion:
        return 'Promotion';
      default:
        return 'All';
    }
  }
}
