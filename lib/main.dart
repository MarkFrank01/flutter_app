import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

//demo 1
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Startup Name',
//      home: new RandomWords(),
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
//    );
//  }
//}


/**
 * demo3 listview
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildings = [
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
      Building(
          BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
      Building(BuildingType.theater, 'United Artists Stonestown Twin',
          '501 Buckingham Way'),
      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant',
          '72 Claremont Blvd'),
      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
      Building(
          BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
      Building(BuildingType.theater, 'United Artists Stonestown Twin',
          '501 Buckingham Way'),
      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant',
          '72 Claremont Blvd'),
    ];

    return MaterialApp(
      title: 'Listview Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buildings"),
        ),
        body: BuildingListView(buildings, (index) => debugPrint('SKTTT')),
      ),
    );
  }
}

/**
 * demo2 布局
 */
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final titleSection = _TitleSection(
//        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
//
//    Widget buttonSection = Container(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          _buildButtonColum(context, Icons.call, 'Call'),
//          _buildButtonColum(context, Icons.near_me, 'ROUTE'),
//          _buildButtonColum(context, Icons.share, "SHARE"),
//        ],
//      ),
//    );
//
//    final textSection = Container(
//        padding: const EdgeInsets.all(32.0),
//        child: Text(
//          '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
//          softWrap: true,
//        ));
//
//    return MaterialApp(
//      title: 'Flutter UI2',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Top Lakes1'),
//        ),
//        // 由于我们的内容可能会超出屏幕的长度，这里把内容都放到 ListView 里。
//        // 除了这种用法，ListView 也可以像我们在 Android 原生开发中使用 ListView 那样，
//        // 根据数据动态生成一个个 item。
//        body: ListView(
//          children: <Widget>[
//            Image.asset(
//              'images/image.jpg',
//              width: 600,
//              height: 240,
//              // cover 类似于 Android 开发中的 centerCrop，其他一些类型，
//              // https://docs.flutter.io/flutter/painting/BoxFit-class.html
//              fit: BoxFit.cover,
//            ),
//            titleSection,
//            buttonSection,
//            textSection
//          ],
//        ),
//      ),
//    );
//  }
//}

/**
 * demo3 ListView
 */
enum BuildingType { theater, restaurant }

class Building {
  final BuildingType type;
  final String title;
  final String address;

  Building(this.type, this.title, this.address);
}

//定义一个回调接口
typedef OnItemClickListener = void Function(int position);

class ItemView extends StatelessWidget {
  final int position;
  final Building building;
  final OnItemClickListener listener;

  //这里的listener会从ListView那传递过来
  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      building.type == BuildingType.restaurant
          ? Icons.restaurant
          : Icons.theaters,
      color: Colors.blue[500],
    );

    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: icon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                building.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(building.address)
            ],
          ),
        )
      ],
    );

    // 一般来说，为了监听手势事件，我们使用 GestureDetector。但这里为了在点击的时候有个
    // 水波纹效果，使用的是 InkWell。
    return InkWell(
      onTap: () => listener(position),
      child: widget,
    );
  }
}

class BuildingListView extends StatelessWidget {
  final List<Building> buildings;
  final OnItemClickListener listener;

  //这是对外接口。外部通过构造函数闯入数据和listener
  BuildingListView(this.buildings, this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: buildings.length,
        itemBuilder: (context, index) {
          return new ItemView(index, buildings[index], listener);
        });
  }
}

//demo2
//布局看这里
class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {

    //为了加上padding，嵌套一个Container
    return Container(
      //设置padding的距离
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          //嵌套为了让标题占满剩余的空间
          Expanded(
            //Expanded只能包含一个子元素,使用的是child
            child: Column(
              // Column 是竖直方向的，cross 为交叉的意思，也就是说，这里设置的是水平方向
              // 的对齐。在水平方向，我们让文本对齐到 start
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //同之前的，为了加入padding
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          //第二个元素
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(starCount.toString())
        ],
      ),
    );
  }
}

//对齐
Widget _buildButtonColum(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max

    mainAxisSize: MainAxisSize.min,

    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

//demo1
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      final divided = ListTile.divideTiles(
        tiles: titles,
        context: context,
      ).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Save Suggestions"),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //每次生成一个单词时被回调

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
      //加入心型图标
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        //在Flutter的响应式架构中,调用setState()会触发对 State 对象的 build() 方法的调用，从而导致UI的更新。
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
}
