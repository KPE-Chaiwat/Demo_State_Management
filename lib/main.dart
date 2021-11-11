import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_demo/add_cubit.dart';
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

var todoFormCubic = TodoCubit(Todo());

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  TextEditingController controllertext_fromfield_tongcustom =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: BlocBuilder<TodoCubit, Todo>(
          bloc: todoFormCubic,
          builder: (context, tong_state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: tong_state.tasks
                        .map((e) => ListTile(
                            title: Text(e.role),
                            trailing: IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   data.tasks.remove(e);
                                  // });
                                  todoFormCubic.remove(e);
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
                          // setState(() {
                          //   data.tasks.add(Tasks(
                          //       role: controllertext_fromfield_tongcustom.text));
                          //   controllertext_fromfield_tongcustom.clear();
                          // });
                          todoFormCubic.add(Tasks(
                              role: controllertext_fromfield_tongcustom.text));
                          controllertext_fromfield_tongcustom.clear();
                        },
                        child: Text("ADD"))
                  ],
                )
              ],
            );
          },
        ));
  }
}
