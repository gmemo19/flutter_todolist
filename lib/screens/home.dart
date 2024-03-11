import 'package:flutter/material.dart';
import 'package:flutter_todolist/constants/color.dart';
import 'package:flutter_todolist/constants/tasktype.dart';
import 'package:flutter_todolist/model/task.dart';
import 'package:flutter_todolist/screens/add_new_task.dart';
import 'package:flutter_todolist/todoitem.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> todo = ["Study Lessons", "Run 5k", "Go to party"];
  // List<String> completed = ["Game metup", "Take Out Trash"];
  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Study Lessons",
      description: "Study COMP117",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Go to party",
      description: "Attend to party",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
  ];

  void AddNewTask(Task newTask) {
    todo.add(newTask);
  }

  List<Task> completed = [
    Task(
      type: TaskType.calender,
      title: "Go to party",
      description: "Attend to party",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            //Header
            Container(
              width: deviceWidth,
              height: deviceHeight / 3,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover,
                  )),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "October 20, 2024",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "My Todo List ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Top Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    return TodoItem(task: todo[index]);
                  },
                )),
              ),
            ),

            //Completed Text
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Completed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            //Bottom Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {
                    return TodoItem(task: completed[index]);
                  },
                )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => AddNewTask(newTask),
                    ),
                  ));
                },
                child: const Text("Add New Task"))
          ],
        ),
      ),
    ));
  }
}
