class Pageable<T> {
  final List<T> content;
  final int totalElements;
  final int pageSize;

  const Pageable({required this.content, required this.totalElements, required this.pageSize});

  int get totalPages => (totalElements / pageSize).ceil();

  factory Pageable.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) itemFromJson,
  ) {
    return Pageable(
      content: json['data'].map<T>((e) => itemFromJson(e)).toList(),
      totalElements: json['totalElements'],
      pageSize: json['pageSize'],
    );
  }

  static Pageable<T> empty<T>() {
    return Pageable(content: [], totalElements: 0, pageSize: 0);
  }
}
