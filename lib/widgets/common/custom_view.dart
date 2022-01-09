import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../utils/read_only_lock.dart';
import 'reorder_items.dart';

class ScrollState {
  final int index;

  const ScrollState({required this.index});
}

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class CustomView<T> extends StatelessWidget {
  final List<Widget> sidebar;
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final VoidCallback onCreate;
  final VoidCallback onClose;
  final VoidCallback onDelete;
  final AutoScrollController controller = AutoScrollController();

  CustomView({
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
    var readOnlyLock = context.watch<ReadOnlyLock>();

    var scrollState = context.read<ScrollState?>();
    if (scrollState != null) {
      controller.scrollToIndex(scrollState.index,
          preferPosition: AutoScrollPosition.begin);
    }

    return Row(
      children: [
        Expanded(
          child: Scaffold(
            body: readOnlyLock.locked
                ? ListView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    itemBuilder: (context, index) => AutoScrollTag(
                      key: Key(index.toString()),
                      controller: controller,
                      index: index,
                      child: itemBuilder(context, items[index]),
                    ),
                  )
                : ReorderableListView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => AutoScrollTag(
                      key: Key(index.toString()),
                      controller: controller,
                      index: index,
                      child: itemBuilder(context, items[index]),
                    ),
                    onReorder: (oldIndex, newIndex) =>
                        reorderItems(items, oldIndex, newIndex),
                  ),
            floatingActionButton: readOnlyLock.locked
                ? null
                : FloatingActionButton(
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
        controller: ScrollController(),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
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
