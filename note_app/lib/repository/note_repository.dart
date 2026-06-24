import 'package:note_app/data/db_helper.dart';
import 'package:note_app/data/note_model.dart';

class NoteRepository {
  final DBHelper _dbHelper = DBHelper();

  Future<List<Note>> getNotes() => _dbHelper.getNotes();
  Future<int> insertNote(Note note) => _dbHelper.insertNote(note);
  Future<int> updateNote(Note note) => _dbHelper.updateNote(note);
  Future<int> deleteNote(int id) => _dbHelper.deleteNote(id);
}