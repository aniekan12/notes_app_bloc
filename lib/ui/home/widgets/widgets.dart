import 'package:flutter/material.dart';

Widget floatingActionButton({required Function()? onPressed}) {
  return FloatingActionButton(
    backgroundColor: Colors.amber,
    onPressed: onPressed,
    child: const Icon(
      Icons.add,
      size: 35,
    ),
  );
}

AppBar notesAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.purpleAccent,
  );
}
