part of 'notes_bloc.dart';

class NotesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNotesEvent extends NotesEvent {
  final List<NotesModel> notes;
  GetNotesEvent({required this.notes});

  @override
  List<Object?> get props => [notes];
}

class AddNotesEvent extends NotesEvent {
  final NotesModel notes;
  AddNotesEvent({required this.notes});

  @override
  List<Object?> get props => [notes];
}

// class DeleteNotesEvent extends NotesEvent {
//   final NotesModel notes;
//   DeleteNotesEvent({required this.notes});

//   @override
//   List<Object?> get props => [notes];
// }

// class UpdateNotesEvent extends NotesEvent {
//   final NotesModel notes;
//   UpdateNotesEvent({required this.notes});

//   @override
//   List<Object?> get props => [notes];
// }
