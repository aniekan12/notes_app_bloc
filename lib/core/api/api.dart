import 'package:notes_app_web/core/models/notes_model.dart';

class Api {
  List<NotesModel> _notes = [
    NotesModel(
      noteTitle: 'Note 1',
      noteContent: 'Description 1',
    ),
    NotesModel(
      noteTitle: 'Note 2',
      noteContent: 'Description 2',
    ),
    NotesModel(
      noteTitle: 'Note 3',
      noteContent: 'Description 3',
    ),
    NotesModel(
      noteTitle: 'Note 4',
      noteContent: 'Description 4',
    ),
    NotesModel(
      noteTitle: 'Note 5',
      noteContent: 'Description 5',
    ),
  ];
  List<NotesModel> get notes => _notes;
  addNotes({required NotesModel notes}) {
    _notes.add(notes);
    return _notes;
  }

  getNotes() {
    return _notes;
  }
}
