import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override //homepage é privado pelo _
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                    title: Text(notes[i]),
                    onTap: () async {
                      var description = await Navigator.pushNamed(
                          context, "/create-note",
                          arguments: notes[i]);
                      //then()
                      // ou utiliza await com async ou then
                      if (description != null) {
                        notes[i] = description as String; //define o tipo
                        setState(() {});
                      }
                    }),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Instância de futuro, pois ainda não tem tal informação
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          //then()
          // ou utiliza await com async ou then
          if (description != null) {
            notes.add(description as String); //define o tipo
            setState(() {});
          }
        },
        child: Text('notes'),
      ),
    );
  }
}
