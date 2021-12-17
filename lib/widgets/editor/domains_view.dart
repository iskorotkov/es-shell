import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/data_type.dart';
import '../../model/domain.dart';
import '../../model/project.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import 'domain_card.dart';

class DomainsView extends StatefulWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DomainsView({Key? key}) : super(key: key);

  @override
  State<DomainsView> createState() => _DomainsViewState();
}

class _DomainsViewState extends State<DomainsView> {
  Domain? _selected;
  List<TextEditingController> _valuesControllers = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Domain>(
      sidebar: _selected != null ? _buildSidebar() : [],
      items: project.domains,
      itemBuilder: (_, domain) => ChangeNotifierProvider<Domain>.value(
        key: Key(domain.uuid),
        value: domain,
        child: DomainCard(
          selected: _selected == domain,
          onTap: () {
            setState(() {
              _selected = domain;
              widget._nameController.text = domain.name;
              widget._descriptionController.text = domain.description;

              _valuesControllers = List.filled(
                domain.values.length,
                TextEditingController(),
                growable: true,
              );

              _valuesControllers.setAll(
                0,
                domain.values
                    .map((e) => TextEditingController()..text = e.toString()),
              );
            });
          },
        ),
      ),
      onCreate: () {
        var created = Domain(
          uuid: const Uuid().v4(),
          name: '',
          description: '',
          dataType: DataType.int,
          values: const [],
        );

        if (_selected == null) {
          setState(() {
            project.domains.add(created);
          });
        } else {
          setState(() {
            var index = project.domains.indexOf(_selected!);
            project.domains.insert(index + 1, created);
          });
        }
      },
      onDelete: () {
        var variablesWithDomain =
            project.variables.where((e) => e.domain == _selected);
        if (variablesWithDomain.isNotEmpty) {
          var names = variablesWithDomain.map((e) => '"${e.name}"').join(', ');

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Can\'t delete domain'),
              content: Text(
                  'Domain "${_selected!.name}" is used in variable${variablesWithDomain.length == 1 ? '' : 's'} $names'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );

          return;
        }

        setState(() {
          project.domains.remove(_selected);
          _selected = null;
        });
      },
      onClose: () {
        setState(() {
          _selected = null;
        });
      },
    );
  }

  List<Widget> _buildSidebar() {
    return [
      TextField(
        controller: widget._nameController,
        onChanged: (value) {
          setState(() {
            _selected!.name = value;
          });
        },
      ),
      TextField(
        controller: widget._descriptionController,
        onChanged: (value) {
          setState(() {
            _selected!.description = value;
          });
        },
      ),
      const CustomViewHeading(text: 'Type'),
      DropdownButtonFormField<DataType>(
        value: _selected!.dataType,
        onChanged: (value) {
          setState(() {
            _selected!.dataType = value ?? _selected!.dataType;
          });
        },
        items: DataType.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.name()),
                  value: e,
                ))
            .toList(),
      ),
      CustomViewHeading(
        text: 'Values',
        onAdd: () {
          setState(() {
            _selected!.values.add('');
            _valuesControllers.add(TextEditingController());
          });
        },
      ),
      for (var i = 0; i < _selected!.values.length; i++)
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _valuesControllers[i],
                onChanged: (value) {
                  setState(() {
                    _selected!.values[i] = value;
                    _selected!.values = _selected!.values;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                setState(() {
                  _selected!.values.removeAt(i);
                });
              },
            ),
          ],
        )
    ];
  }
}
