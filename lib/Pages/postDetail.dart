import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';
import 'package:preservingculturalheritage/Pages/commentPage.dart';

class PostDetail extends StatefulWidget {
  final Users user;
  final HistoricalArtifacts histArt;

  const PostDetail({Key key, this.user, this.histArt}) : super(key: key);
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(widget.user.userName),
          Image(
            image: NetworkImage(widget.histArt.photoUrl),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommentPage(
                            post: widget.histArt,
                          )));
            },
            child: Center(
              child: Text("Yorum yap"),
            ),
          ),
        ],
      ),
    );
  }
}
