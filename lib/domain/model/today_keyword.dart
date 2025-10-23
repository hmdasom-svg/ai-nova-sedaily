import 'keyword_entry.dart';

class TodayKeyword {
  const TodayKeyword({required this.searchDate, required this.keywords});
  final String searchDate;
  final List<KeywordEntry> keywords;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is TodayKeyword &&
        other.searchDate == searchDate &&
        _areKeywordsEqual(other.keywords);
  }

  bool _areKeywordsEqual(List<KeywordEntry> otherKeywords) {
    if (otherKeywords.length != keywords.length) {
      return false;
    }
    for (int index = 0; index < keywords.length; index += 1) {
      if (otherKeywords[index] != keywords[index]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    int hash = searchDate.hashCode;
    for (final KeywordEntry keyword in keywords) {
      hash = hash ^ keyword.hashCode;
    }
    return hash;
  }

  @override
  String toString() {
    return 'TodayKeyword(searchDate: \$searchDate, keywords: \$keywords)';
  }
}
