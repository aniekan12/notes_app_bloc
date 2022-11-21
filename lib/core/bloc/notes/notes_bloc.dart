import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app_web/core/models/notes_model.dart';
import 'package:notes_app_web/core/repositories/notes_repository.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState()) {
    on<GetNotesEvent>(_mapGetNotesEventToState);
  }

  void _mapGetNotesEventToState(
      GetNotesEvent event, Emitter<NotesState> emit) async {
    final notes = NotesRepository();
    try {
      emit(state.copyWith(status: NotesStatus.loading));
      final note = await notes.getNotes();
      emit(state.copyWith(notes: note, status: NotesStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NotesStatus.failure));
    }
  }
}
