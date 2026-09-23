class GoogleFontsReply {
  final String kind;
  final List<WebFont> items;

  GoogleFontsReply({
    required this.kind,
    required this.items,
  });

  factory GoogleFontsReply.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    return GoogleFontsReply(
      kind: json['kind'] as String? ?? '',
      items: rawItems is List
          ? rawItems
              .whereType<Map<String, dynamic>>()
              .map(WebFont.fromJson)
              .toList()
          : const [],
    );
  }
}

class WebFont {
  final String family;
  final List<String> variants;
  final List<String> subsets;
  final String version;
  final String lastModified;
  final Map<String, String> files;
  final String category;
  final String kind;
  final String menu;

  WebFont({
    required this.family,
    required this.variants,
    required this.subsets,
    required this.version,
    required this.lastModified,
    required this.files,
    required this.category,
    required this.kind,
    required this.menu,
  });

  factory WebFont.fromJson(Map<String, dynamic> json) {
    final rawFiles = json['files'];
    return WebFont(
      family: json['family'] as String? ?? '',
      variants: _stringList(json['variants']),
      subsets: _stringList(json['subsets']),
      version: json['version'] as String? ?? '',
      lastModified: json['lastModified'] as String? ?? '',
      files: rawFiles is Map
          ? rawFiles.map((key, value) => MapEntry(key.toString(), value.toString()))
          : const {},
      category: json['category'] as String? ?? '',
      kind: json['kind'] as String? ?? '',
      menu: json['menu'] as String? ?? '',
    );
  }

  static List<String> _stringList(Object? value) {
    return value is List ? value.whereType<String>().toList() : const [];
  }
}
