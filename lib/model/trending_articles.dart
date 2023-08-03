class TrendingArticles {
  final int index;
  final String title, subtitle;

  TrendingArticles(
      {required this.index, required this.title, required this.subtitle});

  factory TrendingArticles.fromJson(Map<String, dynamic> json) {
    return TrendingArticles(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
      };
}

List<TrendingArticles> tArticles = [
  TrendingArticles(
    index: 1,
    title: "First Title",
    subtitle: "First Sub title",
  ),
  TrendingArticles(
    index: 2,
    title: "Second Title",
    subtitle: "Second Sub title",
  ),
  TrendingArticles(
    index: 3,
    title: "Third Title",
    subtitle: "Third Sub title",
  ),
  TrendingArticles(
    index: 4,
    title: "Fourth Title",
    subtitle: "Fourth Sub title",
  ),
  TrendingArticles(
    index: 5,
    title: "Fifth Title",
    subtitle: "Fifth Sub title",
  ),
];
