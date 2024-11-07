import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widget/custom_item_task.dart';

class TasksView extends StatefulWidget {
  TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final EasyInfiniteDateTimelineController controller =
      EasyInfiniteDateTimelineController();

  var focusDate = DateTime(2024);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 50),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.22,
                color: theme.primaryColor,
                child: Text(
                  'TO DO List',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: EasyInfiniteDateTimeLine(
                    controller: controller,
                    firstDate: DateTime(2024),
                    focusDate: focusDate,
                    lastDate: DateTime(2025, 12, 31),
                    onDateChange: (selectedDate) {
                      setState(() {
                        focusDate = selectedDate;
                      });
                    },
                    dayProps: EasyDayProps(
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        dayNumStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: theme.primaryColor,
                        ),
                        monthStrStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: theme.primaryColor,
                        ),
                        dayStrStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: theme.primaryColor,
                        ),
                      ),
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        dayNumStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        monthStrStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        dayStrStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    showTimelineHeader: false,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomItemTask();
            },
          ),
        )
      ],
    );
  }
}
