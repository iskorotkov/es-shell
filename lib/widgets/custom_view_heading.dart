import 'package:flutter/material.dart';

class CustomViewHeading extends StatelessWidget {
  final String text;
  final VoidCallback? onAdd;

  const CustomViewHeading({
    Key? key,
    required this.text,
    this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          if (onAdd != null)
            IconButton(
              splashRadius: 24,
              icon: const Icon(Icons.add),
              onPressed: onAdd,
            ),
        ],
      ),
    );
  }
}
