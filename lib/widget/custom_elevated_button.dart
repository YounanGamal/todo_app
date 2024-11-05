import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({super.key,required this.onPressed, required this.buttonTitle});
   final VoidCallback onPressed ;
final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF00BF6D),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: const StadiumBorder(),
        ),
        child:  Text(buttonTitle),
      ),
    );
  }
}
