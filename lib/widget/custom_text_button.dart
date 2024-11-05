import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text1,
    required this.text2,
  });

  final VoidCallback onPressed;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Text.rich(
        TextSpan(
          text: text1,
          children: [
            TextSpan(
              text: text2,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
