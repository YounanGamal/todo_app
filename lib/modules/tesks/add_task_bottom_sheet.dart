import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/services/snack_bar_service.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/firebase_utils.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();

  DateTime selectDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Nem Task',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: taskController,
                hintText: 'task',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'enter your task';
                  }
                },
                // maxLines: 3,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: descController,
                hintText: 'description',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'enter your description';
                  }
                },
                // maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text('Select date'),
              InkWell(
                onTap: () {
                  getSelectedDateTime();
                },
                child: Text(
                  DateFormat('dd MMM yyyy').format(selectDate),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var taskModel = TaskModel(
                      title: taskController.text,
                      description: descController.text,
                      selectedDate: selectDate,
                    );
                    EasyLoading.show();

                    FirebaseUtils().addTask(taskModel).then((onValue) {
                      Navigator.pop(context);
                      EasyLoading.dismiss();
                      SnackBarService.showSuccessMessage(
                          'Task Added Successful');
                    });
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
  void dialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      body: Center(
        child: Text(
          'Login is Successful',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    )..show();
  }
  getSelectedDateTime() async {
    var currentDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (currentDate != null) {
      setState(() {});
      selectDate = currentDate;
    }
  }
}
