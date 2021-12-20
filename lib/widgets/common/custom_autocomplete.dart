import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final String? value;
  final Iterable<String> items;
  final ValueChanged<String> onCreateNew;
  final ValueChanged<String?> onChanged;
  final bool optional;

  const CustomAutocomplete({
    Key? key,
    required this.value,
    required this.items,
    required this.onCreateNew,
    required this.onChanged,
    this.optional = false,
  }) : super(key: key);

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  final String newItemText = "Create ";
  final String nullItemText = "<empty>";

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      key: Key(widget.value ?? nullItemText),
      initialValue: TextEditingValue(text: widget.value ?? nullItemText),
      optionsBuilder: (TextEditingValue value) {
        var text = value.text;

        if (widget.optional && text == nullItemText) {
          return [nullItemText].followedBy(widget.items);
        }

        var names = widget.items
            .where((e) => e.toLowerCase().contains(text.toLowerCase()));
        if (text.isNotEmpty && !names.contains(text)) {
          names = names.followedBy(['$newItemText$text']);
        }

        if (widget.optional) {
          names = [nullItemText].followedBy(names);
        }

        return names;
      },
      onSelected: (value) {
        if (value == nullItemText) {
          widget.onChanged(null);
          return;
        }

        if (!widget.items.contains(value)) {
          value = value.replaceFirst(newItemText, '');
          widget.onCreateNew(value);
        }

        widget.onChanged(value);
      },
    );
  }
}
