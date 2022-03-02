import 'package:flutter/material.dart';

class FacultyDb extends StatelessWidget {
  const FacultyDb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FacultyDbTable"),
      ),
      body: Container(),
      floatingActionButton: buildMessageButton(),
    );
  }

  Widget buildMessageButton() => FloatingActionButton.extended(
      onPressed: () {},
      label: Text("Update")
  );

  Widget buildNavigateButton() => FloatingActionButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
      onPressed: () {},
    );
}
