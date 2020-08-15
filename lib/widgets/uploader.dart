import 'package:eLesson/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:eLesson/variables.dart';
import 'dart:io';

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key, key, this.file}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage = FirebaseStorage(storageBucket: "gs://elesson-7e33b.appspot.com");

  StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = "images/$userEmail/profile.png";

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;

          double progressPercent = event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (_uploadTask.isComplete)
                Text("Upload completed"),
                FlatButton(
                  child: Icon(Icons.home),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage())
                    ),
                    profileURLExist = true
                  },
                ),
              if (_uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: _uploadTask.resume,
                ),
              if (_uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: _uploadTask.pause,
                ),
              LinearProgressIndicator(value: progressPercent)
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        label: Text("Upload image"),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}