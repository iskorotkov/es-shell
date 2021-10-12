import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class CustomView<T> extends StatelessWidget {
  final List<Widget> sidebar;
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final VoidCallback onDelete;

  const CustomView({
    Key? key,
    required this.sidebar,
    required this.items,
    required this.itemBuilder,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: items.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => itemBuilder(context, items[index]),
          ),
        ),
        SizedBox(
          width: 300,
          child: _buildToolbar(context),
        )
      ],
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Material(
      elevation: 32,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          ...sidebar.map(
            (child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: child,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onDelete,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Delete'),
          )
        ],
      ),
    );
  }
}
