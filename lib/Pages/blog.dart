import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';
import 'package:preservingculturalheritage/Pages/postDetail.dart';
import 'package:preservingculturalheritage/Services/FirebaseHist-ArtServices.dart';
import 'package:preservingculturalheritage/style/theme.dart' as Theme;
import 'package:preservingculturalheritage/Pages/data.dart';

class DetailPage extends StatefulWidget {
  final KulturelMirasInfo info;

  const DetailPage({Key key, this.info}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  List<HistoricalArtifacts> _posts = [];
  Future<void> _getPosts() async {
    List<HistoricalArtifacts> posts = await FirebaseHistArtServices()
        .getHistoricalArtifactsbyType(widget.info.name);
    if (mounted) {
      setState(() {
        _posts = posts;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          widget.info.name,
                          style: TextStyle(
                            fontFamily: 'MontserratLight',
                            fontSize: 56,
                            color: Theme.Colors.primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          widget.info.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'MontserratLight',
                            fontSize: 20,
                            color: Theme.Colors.contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'MontserratLight',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: _posts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          HistoricalArtifacts post = _posts[index];
                          return FutureBuilder(
                              future: FirebaseHistArtServices()
                                  .getUsers(post.userId),
                              builder: (context, snapshot) {
                                Users user = snapshot.data;
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PostDetail(
                                                    histArt: post,
                                                    user: user,
                                                  )));
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        _posts[index].photoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                  tag: widget.info.position,
                  child: Image.asset(widget.info.iconImage)),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                widget.info.position.toString(),
                style: TextStyle(
                  fontFamily: 'MontserratLight',
                  fontSize: 247,
                  color: Theme.Colors.primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
