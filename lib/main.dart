import 'package:flutter/material.dart';
import 'package:state_management_demo/model/model.dart';
//import 'package:state_management_demo/model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String msg = "damo State management";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: msg,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllertext_fromfield_tongcustom =
      TextEditingController();
  var data = Todo();
  // List<String> dataShow = [];
  @override
  void initState() {
    data.tasks.add(Tasks(role: "Sniper"));
    data.tasks.add(Tasks(role: "pudge"));
    data.tasks.add(Tasks(role: "Mirana"));
    // dataShow.add("parin01");
    // dataShow.add("parin02");
    // dataShow.add("parin03");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: data.tasks
                  .map((e) => ListTile(
                      title: Text(e.role),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              data.tasks.remove(e);
                            });
                          },
                          icon: Image.asset("assets/Icons/bin.png"))))
                  .toList(),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                      controller: controllertext_fromfield_tongcustom,
                      decoration:
                          InputDecoration(border: OutlineInputBorder()))),
              TextButton(
                  onPressed: () {
                    setState(() {
                      data.tasks.add(Tasks(
                          role: controllertext_fromfield_tongcustom.text));
                      controllertext_fromfield_tongcustom.clear();
                    });
                  },
                  child: Text("ADD"))
            ],
          )
        ],
      ),
    );
  }
}
