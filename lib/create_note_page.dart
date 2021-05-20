import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";
  var textController = TextEditingController();

  //init state
  @override
  void initState() {
    // inicializa o contexto posteriormente a ser chamado
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //Verifica se os parâmetros passados via homepage estão
      //sendo recebidos além de definir o tipo dele
      if (ModalRoute.of(context)!.settings.arguments != null) {
        // receber dados via navegação
        description = ModalRoute.of(context)!.settings.arguments as String;
        //Controller tem o valor do parâmetro recebido
        textController.text =  description;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              controller: textController,
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
                  child: Text('Salvar')
                  )
          ],
        ),
      ),
    );
  }
}
