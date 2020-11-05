import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  //AddTaskScreen({this.addTaskCallback});
  //final Function addTaskCallback;
  final messageTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String newMessage;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              onChanged: (value) {
                newMessage = value;
              },
              controller: messageTextController,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.lightBlueAccent, width: 5.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextButton(
              onPressed: () {
                if (newMessage != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newMessage);
                  newMessage = null;
                  messageTextController.clear();
                  Navigator.pop(context);
                }
              },
              //color: Colors.lightBlueAccent,
              //textColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
