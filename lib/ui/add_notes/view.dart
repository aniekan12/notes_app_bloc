import 'package:flutter/material.dart';
import 'package:notes_app_web/ui/widgets/app_button.dart';
import 'package:notes_app_web/ui/widgets/custom_textfield.dart';

class AddNewNotes extends StatefulWidget {
  const AddNewNotes({Key? key}) : super(key: key);

  @override
  State<AddNewNotes> createState() => _AddNewNotesState();
}

class _AddNewNotesState extends State<AddNewNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Enter note title',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Enter note content',
            ),
            const SizedBox(height: 20),
            AppButton(onTap: () {}, buttonText: 'Add Notes'),
          ],
        ),
      ),
    );
  }
}
