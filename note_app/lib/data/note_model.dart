class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime date;

  Note({
    this.id,
    required this.title,
    required this.description,
    DateTime? date,
  }) : date = date ?? DateTime.now(); 

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'date': date.toIso8601String(), 
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']), 
    );
  }
}