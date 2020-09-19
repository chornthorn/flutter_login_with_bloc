import 'package:flutter/material.dart';

Future showDialogWidget(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          child: new Row(
            children: [
              CircularProgressIndicator(),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("Loading ..."),
              ),
            ],
          ),
        ),
      );
    },
  );
}
