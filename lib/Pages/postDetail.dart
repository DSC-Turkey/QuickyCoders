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
  int sikayetSayisi = 0;
  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('tr', timeago.TrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
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
          ),
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MontserratBold',
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
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
                    child: Text(
                      "TARTIŞMAYA KATIL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MontserratBold',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: RaisedButton(
                    color: theme.Colors.gradientStartColor,
                    onPressed: () {
                      setState(() {
                        sikayetSayisi++;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ŞİKAYET ET",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MontserratBold',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Şikayet Sayısı:" + sikayetSayisi.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MontserratBold',
                            fontSize: 12,
                          ),
                        ),
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
            child: Text(
              "Oluşturma Tarihi:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MontserratBold',
                fontSize: 13,
              ),
            ),
          ),
          Center(
            child: Text(timeago.format(
              widget.histArt.createTime.toDate(),
              locale: "tr",
            )),
          ),
        ],
      ),
    );
  }
}
