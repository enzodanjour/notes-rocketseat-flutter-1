import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";

  @override
  Widget build(BuildContext context) {
    //Verifica se os parâmetros passados via homepage estão sendo recebidos
    if (ModalRoute.of(context)!.settings.arguments != null) {
      description = ModalRoute.of(context)!.settings.arguments as String;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Create note page"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              maxLines: null,
              cursorColor: Colors.amber,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
            ),
            if (description.isNotEmpty)
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, description);
                  },
                  child: Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
