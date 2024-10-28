import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.backgroundColor});
  final void Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).primaryColor),
          onPressed: onPressed,
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
          )),
    );
  }
}
