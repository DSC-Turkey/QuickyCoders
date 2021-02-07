import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';
import 'package:preservingculturalheritage/Pages/Profile.dart';
import 'package:preservingculturalheritage/Pages/commentPage.dart';
import 'package:preservingculturalheritage/style/theme.dart' as theme;
import 'package:timeago/timeago.dart' as timeago;

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
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileApp(
                            profilOwnerId: widget.user.id,
                          )));
            },
            child: Text(
              "Yayınlayan: " + widget.user.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          SizedBox(
            height: 380,
            child: Image(
              image: NetworkImage(widget.histArt.photoUrl),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              "Açıklama: " + widget.histArt.description,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 130,
                  width: 200,
                  child: RaisedButton(
                    color: theme.Colors.homepage,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentPage(
                                    post: widget.histArt,
                                  )));
                    },
                    child: Text("TARTIŞMAYA KATIL"),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 200,
                  child: RaisedButton(
                    color: Color(0xffec4646),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ŞİKAYET ET"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Şikayet Sayısı:"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Oluşturma Tarihi:"),
          ),
          Center(
            child: Text(timeago.format(widget.histArt.createTime.toDate(),
                locale: "tr")),
          ),
        ],
      ),
    );
  }
}
