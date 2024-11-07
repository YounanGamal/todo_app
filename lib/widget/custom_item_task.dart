import 'package:flutter/material.dart';

class CustomItemTask extends StatelessWidget {
  CustomItemTask({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // height: mediaQuery.size.height * .12,
      // width: mediaQuery.size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.primaryColor,
          ),
          height: 90,
          width: 5,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Play basket ball',
              style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor),
            ),
            const SizedBox(
              width: 10,
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
                  '10:30 AM',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
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
    );
  }
}
