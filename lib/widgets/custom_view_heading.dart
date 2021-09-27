import 'package:flutter/material.dart';

class CustomViewHeading extends StatelessWidget {
  final String text;

  const CustomViewHeading({Key? key, required this.text}) : super(key: key);

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
          IconButton(
            splashRadius: 24,
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
