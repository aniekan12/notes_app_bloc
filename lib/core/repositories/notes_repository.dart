import 'package:notes_app_web/core/api/api.dart';
import 'package:notes_app_web/core/models/notes_model.dart';

class NotesRepository {
  final api = Api();
  Future getNotes() {
    return api.getNotes();
  }

  // Future addNotes({required List< notes}) {
  //   return api.addNotes(notes: notes);
  // }
}
