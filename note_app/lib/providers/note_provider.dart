import 'package:flutter/material.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/di/service_locator.dart';
import 'package:note_app/repository/note_repository.dart';

class NoteProvider extends ChangeNotifier {
  final NoteRepository _repository = getIt<NoteRepository>();
  List<Note> _notes = [];
  bool _isLoading = false;
  
  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;
  
  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();
    try {
      _notes = await _repository.getNotes();
    } catch (e) {
      _notes = [];
      debugPrint('fetchNotes error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(Note note) async {
    await _repository.insertNote(note);
    await fetchNotes(); // Refresh the list
  }

  Future<void> updateNote(Note note) async {
    await _repository.updateNote(note);
    await fetchNotes(); // Refresh the list
  }
  
  Future<void> deleteNote(int id) async {
    await _repository.deleteNote(id);
    await fetchNotes(); // Refresh the list
  }
}