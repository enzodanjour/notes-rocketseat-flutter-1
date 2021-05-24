import 'package:flutter/material.dart';
/// não é usado pois dá algum erro do widget esperado ser outro
/// mas caso vá aplicar use preferredSizedWidget
class AppBarWidget extends StatelessWidget {
  final String name;
  final bool isEditing;

  const AppBarWidget({
    Key? key,
    required this.name,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarWidget(name: name, isEditing: isEditing),
      centerTitle: true,
      actions: [
        name.toString() =='notes' ?
        Container():
        isEditing
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context, "");
                })
            : Container()
      ],
    );
  }
}
