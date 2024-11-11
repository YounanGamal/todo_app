import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 60),
          width: mediaQuery.size.width,
          height: mediaQuery.size.height * 0.22,
          color: theme.primaryColor,
          child: Text(
            'Settings',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                textAlign: TextAlign.left,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown<String>(
                hintText: 'Select language',
                items: languageList,
                initialItem: languageList[0],
                onChanged: (value) {},
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.05,
              ),
              Text(
                'Theme',
                textAlign: TextAlign.right,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown<String>(
                hintText: 'Select theme',
                items: themeList,
                initialItem: themeList[0],
                onChanged: (value) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

const List<String> languageList = ['English', 'Arabic'];
const List<String> themeList = ['light', 'dark'];
