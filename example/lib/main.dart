import 'package:flutter/material.dart';
import 'package:flutter_animated_play_button/flutter_animated_play_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'flutter_animated_play_button Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'flutter_animated_play_button Demo'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('flutter_animated_play_button provides a simple button,' +
                        ' "AnimatedPlayButton".' +
                        ' It has several animation bar which implies an app is playing something.\n\n' +
                        'Once you are working on a media app, you may consider to adopt flutter_animated_play_button in your UI design.')),
                ListTile(
                  title: Text(
                      'AnimatedPlayButton has two states. One is the animating state.'),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: AnimatedPlayButton(
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                      'There is a paused state. It implies your app pauses playing.'),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: AnimatedPlayButton(
                      stopped: true,
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('You can change the color of the bars.'),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: AnimatedPlayButton(
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
