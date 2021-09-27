import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback onDelete;

  const CustomView({
    Key? key,
    required this.title,
    required this.description,
    required this.children,
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
            itemCount: 20,
            padding: const EdgeInsets.all(8),
            itemBuilder: itemBuilder,
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
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: TextEditingController()..text = title,
          ),
          TextField(
            controller: TextEditingController()..text = description,
          ),
          const SizedBox(height: 32),
          ...children.map(
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
