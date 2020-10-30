import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              onLongPressCallback: () {
                taskData.deleteTask(task);
              },
              title: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxValue) {
                taskData.updateTask(task);
              },
            );
          },
        );
      },
    );
  }
}
