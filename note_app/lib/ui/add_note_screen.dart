import 'package:note_app/ui/note_list_screen.dart';

class _AddNoteScreenState extends State<AddNoteScreen> {
// ... controllers and form key
void _saveNote() {
if (_formKey.currentState!.validate()) {
final note = Note(
id: widget.note?.id,
title: _titleController.text,
description: _descriptionController.text,
);
// Use the provider to save the note
final provider = Provider.of<NoteProvider>(context, listen: false);
if (widget.note == null) {
provider.addNote(note);
} else {
provider.updateNote(note);
}
Navigator.pop(context);
}
}
// ... build method
}