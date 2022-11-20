import 'package:flutter/material.dart';
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
      body: ListView(),
      floatingActionButton: floatingActionButton(onPressed: () {}),
    );
  }
}
