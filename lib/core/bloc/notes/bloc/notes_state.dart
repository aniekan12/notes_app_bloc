part of 'notes_bloc.dart';

@immutable
abstract class NotesState extends Equatable {}

class NotesInitial extends NotesState {
  @override
  List<Object?> get props => [];
}
