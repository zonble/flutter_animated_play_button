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
  var _stopped = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SafeArea(
            child: Scrollbar(
                child: Center(
                    child: SingleChildScrollView(
                        child: Center(
                            child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 600),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            bottom: 0,
                                            right: 16),
                                        child: Text('About',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                      ),
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
                                      ListTile(
                                        title: Text(
                                            'There is a paused state. It implies your app pauses playing.'),
                                        leading: Container(
                                          width: 50,
                                          height: 50,
                                          child: AnimatedPlayButton(
                                            child: Container(),
                                            stopped: true,
                                            color: Colors.red,
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                            'You can change the color of the bars.'),
                                        leading: Container(
                                          width: 50,
                                          height: 50,
                                          child: AnimatedPlayButton(
                                            child: Container(),
                                            color: Colors.blue,
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32,
                                            left: 16,
                                            bottom: 0,
                                            right: 16),
                                        child: Text('The Widget in Action',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: AnimatedPlayButton(
                                                stopped: _stopped,
                                                color: Colors.orange,
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton(
                                              child: Text('Start Animatiiong'),
                                              onPressed: () => setState(
                                                  () => _stopped = false),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton(
                                              child: Text('Stop Animatiiong'),
                                              onPressed: () => setState(
                                                  () => _stopped = true),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32,
                                            left: 16,
                                            bottom: 0,
                                            right: 16),
                                        child: Text('Usage',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            '''
Container(
  width: 50,
  height: 50,
  child: AnimatedPlayButton(
    stopped: _stopped,
    color: Colors.blue,
    onPressed: () {},
  ),
)
                          ''',
                                            style: TextStyle(
                                                fontFamily: 'Courier'),
                                          ))
                                    ]))))))),
      );
}
