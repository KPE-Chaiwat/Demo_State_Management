import 'package:flutter/material.dart';

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
      home: const HomePage(
        title: msg,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllertext_fromfield_tongcustom =
      TextEditingController();
  List<String> dataShow = [];
  @override
  void initState() {
    dataShow.add("parin01");
    dataShow.add("parin02");
    dataShow.add("parin03");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: dataShow
                  .map((e) => ListTile(
                      title: Text(e),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              dataShow.remove(e);
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
                      dataShow.add(controllertext_fromfield_tongcustom.text);
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
