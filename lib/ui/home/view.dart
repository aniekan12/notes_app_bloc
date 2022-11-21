import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_web/core/bloc/notes/notes_bloc.dart';
import 'package:notes_app_web/ui/add_notes/view.dart';
import 'package:notes_app_web/ui/home/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: notesAppBar(title: 'Notes Home'),
        body: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state.status == NotesStatus.initial) {
              return const Center(
                child: Text('Welcome to notes app'),
              );
            }
            if (state.status == NotesStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == NotesStatus.failure) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }
            if (state.status == NotesStatus.success) {
              return ListView.builder(
                itemCount: state.notes!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(state.notes![index].noteTitle),
                      const SizedBox(height: 20),
                      Text(state.notes![index].noteContent),
                    ],
                  );
                },
              );
            }
            return ListView(
              children: [],
            );
          },
        ),
        floatingActionButton: floatingActionButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                isDismissible: true,
                builder: (context) {
                  return const FractionallySizedBox(
                    heightFactor: 0.93,
                    child: AddNewNotes(),
                  );
                })));
  }
}
