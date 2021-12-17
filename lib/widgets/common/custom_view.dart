import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class CustomView<T> extends StatelessWidget {
  final List<Widget> sidebar;
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final VoidCallback onCreate;
  final VoidCallback onClose;
  final VoidCallback onDelete;

  const CustomView({
    Key? key,
    required this.sidebar,
    required this.items,
    required this.itemBuilder,
    required this.onCreate,
    required this.onClose,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
            body: ReorderableListView.builder(
              scrollController: ScrollController(),
              itemCount: items.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) =>
                  itemBuilder(context, items[index]),
              onReorder: (oldIndex, newIndex) {
                var value = items[oldIndex];

                if (newIndex > oldIndex) {
                  for (var i = oldIndex; i < newIndex - 1; i++) {
                    items[i] = items[i + 1];
                  }

                  items[newIndex - 1] = value;
                } else {
                  for (var i = oldIndex; i > newIndex; i--) {
                    items[i] = items[i - 1];
                  }

                  items[newIndex] = value;
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: onCreate,
              child: const Icon(Icons.add),
            ),
          ),
        ),
        if (sidebar.isNotEmpty)
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
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
            onPressed: onClose,
            child: const Text('Close'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onDelete,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
