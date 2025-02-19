class RecepieItem {
  final String recepieName;
  final String recepieImageUrl;

  RecepieItem({
    required this.recepieName,
    required this.recepieImageUrl,
  });

  factory RecepieItem.fromJson(Map<String, dynamic> json) {
    return RecepieItem(
      recepieName: json['recepieName'] ?? '',
      recepieImageUrl: json['recepieImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recepieName': recepieName,
      'recepieImageUrl': recepieImageUrl,
    };
  }

  static List<RecepieItem> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RecepieItem.fromJson(json)).toList();
  }
}
