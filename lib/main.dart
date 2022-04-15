import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain reading',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final double wallThickness = 75.0;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  void _navigateToSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lets Read your Brain"),
      ),
      body: Center(
        child: Text("Think of number between 1-50", style: TextStyle(fontSize: 25, color: Colors.black), ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToSecondScreen,
        tooltip: 'Start',
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final double wallThickness = 75.0;

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  int screen = 0;
  int result = 0;
  String title = "Loading your brain....";
  List<List<String>> table1 = [
    ["21", "25", "47", "13", "39"],
    ["1", "23", "35", "19", "31"],
    ["15", "3", "29", "7", "11"],
    ["5", "43", "41", "9", "27"],
    ["33", "37", "45", "17", "49"],
  ];

  List<List<String>> table2 = [
    ["47", "35", "23", "11", "2"],
    ["39", "27", "35", "15", "3"],
    ["26", "38", "14", "6", "18"],
    ["7", "10", "22", "34", "46"],
    ["31", "34", "42", "50", "42"],
  ];

  List<List<String>> table3 = [
    ["21", "38", "28", "14", "4"],
    ["39", "29", "15", "5", "30"],
    ["20", "6", "21", "7", "12"],
    ["47", "37", "23", "13", "46"],
    ["36", "31", "45", "44", "22"],
  ];

  List<List<String>> table4 = [
    ["25", "42", "28", "14", "8"],
    ["43", "29", "15", "9", "30"],
    ["24", "10", "25", "11", "12"],
    ["47", "41", "27", "13", "44"],
    ["45", "31", "26", "40", "46"],
  ];

  List<List<String>> table5 = [
    ["23", "16", "21", "26", "31"],
    ["17", "22", "27", "48", "18"],
    ["23", "28", "49", "19", "24"],
    ["29", "50", "20", "25", "30"],
    ["", "", "", "", ""],
  ];

  List<List<String>> table6 = [
    ["39", "32", "37", "42", "47"],
    ["33", "38", "43", "48", "34"],
    ["39", "44", "49", "35", "40"],
    ["41", "45", "50", "36", "46"],
    ["", "", "", "", ""],
  ];


  void _incrementCounterYes() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      screen++;
      switch(screen) {
        case 1: { result++; table1 = table2; title = "Loading your brain....15%";break;}
        case 2: { result = result + 2; table1 = table3; title = "Loading your brain....30%";break;}
        case 3: { result = result+ 4; table1 = table4; title = "Loading your brain....45%";break;}
        case 4: { result = result+ 8; table1 = table5; title = "Loading your brain....70%";break;}
        case 5: { result = result+ 16; table1 = table6; title = "Loading your brain....85%";break;}
        case 6: { result = result+ 32;Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(result: result,)),
        ); break;}
      }
    });
  }

  void _incrementCounterNo() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      screen++;
      switch(screen) {
        case 1: { table1 = table2; break;}
        case 2: { table1 = table3; break;}
        case 3: { table1 = table4; break;}
        case 4: { table1 = table5; break;}
        case 5: { table1 = table6; break;}
        case 6: { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(result: result,)),
        );break;}
      }
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
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
          Card(child: DataTable(
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          rows:
          table1 // Loops through dataColumnText, each iteration assigning the value to element
              .map(
            ((element) => DataRow(
              cells: <DataCell>[
                DataCell(Text(element[0])),
                //Extracting from Map element the value
                DataCell(Text(element[1])),
                DataCell(Text(element[2])),
                DataCell(Text(element[3])),
                DataCell(Text(element[4])),
              ],
            )),
          )
              .toList(),
        ),),
            Column(
              children: <Widget>[
                Center(child: Text("Can you find your number in the table ?", style:TextStyle(fontSize: 20, color: Colors.blue),),
                )
               ],
            )
          ],
        ),
      ),

      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: _incrementCounterYes,
          color: Colors.green,
          child: Text('Yes', style: TextStyle(fontSize: 10, color: Colors.black),),
        ),
        RaisedButton(
          onPressed: _incrementCounterNo,
          color: Colors.orange,
          child: Text('No', style: TextStyle(fontSize: 10, color: Colors.black),),
        )
      ], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ResultPage extends StatefulWidget {
  int result;
  ResultPage({Key key, this.result}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final double wallThickness = 75.0;

  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  void _navigateToMain() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  String calculateResult() {
    String resultString = "";
    if(this.widget.result == 0 || this.widget.result > 50) {
      resultString = "You seemed to have missed the number in one of the table";
    } else {
      resultString = "The Number is "+ this.widget.result.toString();
    }
    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Text(calculateResult(), style: TextStyle(fontSize: 25, color: Colors.black), ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToMain,
        tooltip: 'Playagain',
        child: Icon(Icons.refresh),
      ),
    );
  }
}