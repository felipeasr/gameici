class Cardmodel {
  late final String title;
  late final String url;
  late final String description;
  Cardmodel({
    required this.title,
    required this.description,
    required this.url,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'url': url,
    };
  }
}
