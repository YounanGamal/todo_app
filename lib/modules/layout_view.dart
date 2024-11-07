import 'package:flutter/material.dart';
import 'package:todo_app/modules/setttings/settings_view.dart';
import 'package:todo_app/modules/tesks/tasks_view.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  List<Widget> tabs = [
     TasksView(),
    const SettingsView(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 88,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {

            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(

                icon: Icon(
                  Icons.list,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Sttings'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {},
        child: CircleAvatar(
          backgroundColor: theme.primaryColor,
          radius: 25,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: tabs[currentIndex],
    );
  }
}
