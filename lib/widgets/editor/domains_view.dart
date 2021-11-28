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
        value: domain,
        child: DomainCard(
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
        setState(() {
          project.domains.add(Domain(
            uuid: const Uuid().v4(),
            name: '',
            description: '',
            dataType: DataType.int,
            values: const [],
          ));
        });
      },
      onDelete: () {
        setState(() {
          project.domains.remove(_selected);
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
      DropdownButton<DataType>(
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
        TextField(
          controller: _valuesControllers[i],
          onChanged: (value) {
            setState(() {
              _selected!.values[i] = value;
              _selected!.values = _selected!.values;
            });
          },
        )
    ];
  }
}
