import 'dart:io';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:preservingculturalheritage/Services/FirebaseHist-ArtServices.dart';
import 'package:preservingculturalheritage/Services/FirebaseStorageService.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File file;
  bool loading = false;
  String _myActivity;
  // ignore: unused_field
  String _myActivityResult;
  TextEditingController descriptionText = TextEditingController();
  TextEditingController locationText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: file == null ? uploadScreen() : uploadForm(),
    );
  }

  Widget uploadForm() {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "Gonderi Oluştur",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              file = null;
            });
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.grey[400],
              ),
              onPressed: _createPost),
        ],
      ),
      body: ListView(
        children: <Widget>[
          loading
              ? LinearProgressIndicator()
              : SizedBox(
                  height: 0.0,
                ),
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: descriptionText,
            decoration: InputDecoration(
                hintText: "Açıklama Ekle",
                contentPadding: EdgeInsets.only(left: 15.0, right: 15.0)),
          ),
          TextFormField(
            controller: locationText,
            decoration: InputDecoration(
                hintText: "Konum",
                contentPadding: EdgeInsets.only(left: 15.0, right: 15.0)),
          ),
          DropDownFormField(
            titleText: 'Gönderi Tipi',
            hintText: 'Lütfen bir tane seçin',
            value: _myActivity,
            onSaved: (value) {
              setState(() {
                _myActivity = value;
              });
            },
            onChanged: (value) {
              setState(() {
                _myActivity = value;
              });
            },
            dataSource: [
              {
                "display": "Anıtlar",
                "value": "Anıtlar",
              },
              {
                "display": "Yapı Toplulukları",
                "value": "Yapı Toplulukları",
              },
              {
                "display": "Sitler",
                "value": "Sitler",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
        ],
      ),
    );
  }

  Widget uploadScreen() {
    return Container(
      decoration: new BoxDecoration(color: Colors.orange[300]),
      child: IconButton(
          icon: Icon(
            Icons.file_upload,
            size: 50.0,
            color: Colors.grey[100],
          ),
          onPressed: () {
            pickPhoto();
          }),
    );
  }

  pickPhoto() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Eser Ekle"),
            children: [
              SimpleDialogOption(
                child: Text("Fotoğraf Çek"),
                onPressed: () {
                  useCamera();
                },
              ),
              SimpleDialogOption(
                child: Text("Galeriden Yükle"),
                onPressed: () {
                  useGallery();
                },
              ),
              SimpleDialogOption(
                child: Text("İptal"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  useCamera() async {
    Navigator.pop(context);
    var image = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 800.0,
        maxHeight: 600.0,
        imageQuality: 80);
    setState(() {
      file = File(image.path);
    });
  }

  useGallery() async {
    Navigator.pop(context);
    var image = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 800.0,
        maxHeight: 600.0,
        imageQuality: 80);
    setState(() {
      file = File(image.path);
    });
  }

  void _createPost() async {
    if (!loading) {
      setState(() {
        loading = true;
      });
      String imageUrl = await FirebaseStorageService().postImageUpload(file);
      String activeUserId =
          Provider.of<AuthService>(context, listen: false).activeUserId;
      await FirebaseHistArtServices().createPost(
        postimageUrl: imageUrl,
        description: descriptionText.text,
        type: _myActivity,
        location: locationText.text,
        userId: activeUserId,
      );
      setState(() {
        loading = false;

        file = null;
      });
    }
  }
}
