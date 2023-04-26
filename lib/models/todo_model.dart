// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String title;
  final bool isDone;

  Todo({required this.title, required this.isDone});

  Todo copyWith({
    String? title,
    bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() => 'Todo(title: $title, isDone: $isDone)';
}
