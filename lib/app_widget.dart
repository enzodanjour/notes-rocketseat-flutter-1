import 'package:flutter/material.dart';
import 'package:notes/core/themes.dart';
import 'package:notes/pages/notes_customize/create_note_page.dart';
import 'package:notes/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      theme:ThemesApp.light,
      home: HomePage(),
      initialRoute: "/home",
      routes: {
        //Primeira rota por defaut é barra "/""
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
