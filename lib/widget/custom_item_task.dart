import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/firebase_utils.dart';

class CustomItemTask extends StatelessWidget {
  CustomItemTask({super.key, required this.taskModel});

  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.3,
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                FirebaseUtils().deleteTask(taskModel);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          // margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: taskModel.isDone == true
                    ? Colors.green
                    : theme.primaryColor,
              ),
              height: 90,
              width: 5,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: taskModel.isDone == true
                          ? Colors.green
                          : theme.primaryColor),
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_alarm,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${taskModel.selectedDate.hour}' +
                          ':${taskModel.selectedDate.minute}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                FirebaseUtils().updateTask(taskModel);
              },
              child: taskModel.isDone == true
                  ? Text(
                      'Done!',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    )
                  : Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: theme.primaryColor,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
