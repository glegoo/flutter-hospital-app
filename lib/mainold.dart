import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '沈阳未命名医院',
      theme: new ThemeData(
        primaryColor: Color.fromARGB(255, 129, 187, 40),
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _titleFont = const TextStyle(color: Colors.white, fontSize: 18.0);
  final _biggerFont = const TextStyle(fontSize: 18.0);
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.list,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: new Text(
          '沈阳未命名医院',
          style: _titleFont,
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: _pushSaved),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 200.0,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  "static/images/home_swiper_1.png",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(),
            ),
          ),
          new Wrap(
            children: <Widget>[
              new Image.asset("static/images/btn_home_green.png",width: 100, height: 200,),
              new Image.asset("static/images/btn_home_blue.png"),
              new Image.asset("static/images/btn_home_yellow.png"),
              new Image.asset("static/images/btn_home_pink.png"),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 60, 148, 61),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text("消息")),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file), title: Text("挂号")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}
