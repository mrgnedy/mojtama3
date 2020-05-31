import 'dart:io';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  File _image_path;

  ImageDialog(this._image_path);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 200,
        width: 100,
        child: ListView(
          children: <Widget>[
            Image.file(_image_path),
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ok")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
