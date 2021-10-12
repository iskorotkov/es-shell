import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> firstColumnChildren;
  final List<Widget>? secondColumnChildren;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.firstColumnChildren,
    this.secondColumnChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: firstColumnChildren,
              ),
            ),
            if (secondColumnChildren != null) ...[
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: secondColumnChildren!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
