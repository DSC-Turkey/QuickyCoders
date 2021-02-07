import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';
import 'package:preservingculturalheritage/Pages/uploadPage.dart';
import 'package:preservingculturalheritage/Services/FirebaseHist-ArtServices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HistoricalArtifacts> _posts = [];
  Future<void> _getPosts() async {
    List<HistoricalArtifacts> posts =
        await FirebaseHistArtServices().getHistoricalArtifacts();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: buildText(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UploadPage()));
        },
      ),
    );
  }

  ListView buildText() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: _posts.length,
      itemBuilder: (BuildContext context, int index) {
        HistoricalArtifacts post = _posts[index];
        return FutureBuilder(
          future: FirebaseHistArtServices().getUsers(post.userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              print("NoData");
            }

            return postCard(post);
          },
        );
      },
    );
  }

  postCard(HistoricalArtifacts post) {
    return Image(image: NetworkImage(post.photoUrl));
  }
}
