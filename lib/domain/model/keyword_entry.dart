typedef NamedEntityType = String;

class KeywordEntry {
  const KeywordEntry({
    required this.keywordName,
    required this.mentionCount,
    required this.namedEntityType,
  });
  final String keywordName;
  final int mentionCount;
  final NamedEntityType namedEntityType;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is KeywordEntry &&
        other.keywordName == keywordName &&
        other.mentionCount == mentionCount &&
        other.namedEntityType == namedEntityType;
  }

  @override
  int get hashCode {
    return keywordName.hashCode ^
        mentionCount.hashCode ^
        namedEntityType.hashCode;
  }

  @override
  String toString() {
    return 'KeywordEntry(keywordName: \$keywordName, mentionCount: \$mentionCount, namedEntityType: \$namedEntityType)';
  }
}
