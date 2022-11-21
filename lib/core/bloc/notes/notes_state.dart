part of 'notes_bloc.dart';

enum NotesStatus { initial, loading, success, failure }

extension NotesStatusX on NotesStatus {
  bool get isInitial => this == NotesStatus.initial;
  bool get isLoading => this == NotesStatus.loading;
  bool get isSuccess => this == NotesStatus.success;
  bool get isFailure => this == NotesStatus.failure;
}

class NotesState extends Equatable {
  final List<NotesModel>? notes;
  final NotesStatus? status;

  const NotesState({
    this.notes,
    this.status = NotesStatus.initial,
  });

  @override
  List<Object?> get props => [notes, status];

  NotesState copyWith({
    List<NotesModel>? notes,
    NotesStatus? status,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }
}
