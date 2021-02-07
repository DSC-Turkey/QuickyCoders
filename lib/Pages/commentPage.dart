import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Comment.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:preservingculturalheritage/Services/FirebaseCommentService.dart';
import 'package:preservingculturalheritage/Services/FirebaseHist-ArtServices.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:preservingculturalheritage/style/theme.dart' as theme;

class CommentPage extends StatefulWidget {
  final HistoricalArtifacts post;

  const CommentPage({Key key, this.post}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  TextEditingController _commentControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        //shadowColor: Colors.grey[400],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    theme.Colors.gradientStartColor,
                    theme.Colors.homepage
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.3, 0.7])),
        ),
      ),
      body: Column(
        children: <Widget>[
          _showComment(),
          addComment(),
        ],
      ),
    );
  }

  _showComment() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseCommentService().getComments(widget.post.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              Comment comment =
                  Comment.createDocument(snapshot.data.docs[index]);
              return _commentLine(comment);
            },
          );
        },
      ),
    );
  }

  _commentLine(Comment comment) {
    return FutureBuilder<Users>(
        future: FirebaseHistArtServices().getUsers(comment.publisherId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              height: 0.0,
            );
          }
          Users yayinlayan = snapshot.data;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(yayinlayan.photoUrl),
            ),
            title: RichText(
              text: TextSpan(
                  text: yayinlayan.userName + " ",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: comment.detail,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    )
                  ]),
            ),
            subtitle:
                Text(timeago.format(comment.createTime.toDate(), locale: "tr")),
          );
        });
  }

  addComment() {
    return ListTile(
      title: TextFormField(
        controller: _commentControl,
        decoration: InputDecoration(
          hintText: "Yorumu Buraya Yazın",
        ),
      ),
      trailing: IconButton(icon: Icon(Icons.send), onPressed: _addComment),
    );
  }

  void _addComment() {
    String activeUserID =
        Provider.of<AuthService>(context, listen: false).activeUserId;
    FirebaseCommentService().addComment(
      activeUserId: activeUserID,
      post: widget.post,
      detail: _commentControl.text,
    );
    _commentControl.clear();
  }
}
