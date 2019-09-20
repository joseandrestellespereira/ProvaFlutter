import 'package:prova/imc.dart';
import 'package:prova/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciando Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //aqui vai o avatar com informações 
            new UserAccountsDrawerHeader(
              accountEmail: new Text("josetelles@gmail.com"),
              accountName: new Text("José Andres Telles Pereira"),
              currentAccountPicture: new GestureDetector(
                onTap: () => new Tooltip(
                  message: "Texto",
                  child: new Text("Exemplo"),
                ),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://observatoriodocinema.bol.uol.com.br/wp-content/uploads/2019/08/Thanos.png"),
                ),
              ),
            ), 

            new ListTile(
              title: new Text("Menu"),
              trailing: new Icon(Icons.add_alert),
            ), 
            new ListTile(
              title: new Text("Cálculo IMC"),
              trailing: new Icon(Icons.add_box),
              onTap: ()  {
                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                Calculo()));
              },
            ), 
            new ListTile(
              title: new Text("GET Ouvidorias"),
              trailing: new Icon(Icons.add_box),
              onTap: ()  {
                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                Get()));
              },
            )
          ],
        ),    
      ),//
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        /*child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 300,
              height: 100,
              child: Text('A card that can be tapped'),
            ),
          ),
        ),
        */
        child: new CupertinoButton(
          child: new Text("Teste"),
          color: Colors.red,
        ),

/*        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pressione o Botão:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
