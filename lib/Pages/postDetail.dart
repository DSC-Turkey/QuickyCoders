import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';

class PostDetail extends StatefulWidget {
  final Users user;
  final HistoricalArtifacts histArt;

  const PostDetail({Key key, this.user, this.histArt}) : super(key: key);
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Image(
            image: NetworkImage(widget.histArt.photoUrl),
          ),
          Text(widget.histArt.description),
          Text(widget.histArt.description),
          Text(widget.histArt.description),
        ],
      ),
    );
  }
}
