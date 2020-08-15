import 'package:eLesson/variables.dart';
import 'package:eLesson/widgets/uploader.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      androidUiSettings: AndroidUiSettings(
        toolbarColor: Colors.black
      )
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              IconButton(
                icon: Icon(Icons.photo_library),
                onPressed: () => _pickImage(ImageSource.gallery),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            if (_imageFile != null) ...[
              Image.file(_imageFile),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.crop),
                    onPressed: _cropImage,
                  ),
                  FlatButton(
                    child: Icon(Icons.refresh),
                    onPressed: _clear,
                  )
                ],
              ),
              Uploader(file: _imageFile)
            ]
          ],
        ),
      ),
    );
  }
}