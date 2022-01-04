import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/read_only_lock.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String? question;
  final bool selected;
  final List<Widget> firstColumnChildren;
  final List<Widget>? secondColumnChildren;
  final VoidCallback? onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    this.question,
    required this.firstColumnChildren,
    this.selected = false,
    this.secondColumnChildren,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var readOnlyLock = context.watch<ReadOnlyLock?>();
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      color: selected ? Theme.of(context).primaryColor : null,
      child: InkWell(
        onTap: (readOnlyLock != null && readOnlyLock.locked) ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    if (question != null)
                      Text(
                        question!,
                        style: Theme.of(context).textTheme.caption,
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
      ),
    );
  }
}
