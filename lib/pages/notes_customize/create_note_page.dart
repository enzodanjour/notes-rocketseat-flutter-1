import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";
  var textController = TextEditingController();
  bool isEditing = false;

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
        textController.text = description;
        isEditing = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit note" : "Create note"),
        centerTitle: true,
        actions: [
          isEditing
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Navigator.pop(context,"");
                  })
              : Container()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              cursorColor: Colors.amber,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: "Descrição"
              ),
            ),
            SizedBox(height: 100),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, description);
                      },
                      child: Text('Salvar')
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
