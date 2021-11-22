import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_type.dart';
import '../model/domain.dart';
import '../model/project.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'domain_card.dart';

class DomainsView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DomainsView({Key? key}) : super(key: key);

  @override
  State<DomainsView> createState() => _DomainsViewState();
}

class _DomainsViewState extends State<DomainsView> {
  Domain? _selected;
  List<TextEditingController> valuesControllers = <TextEditingController>[];

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
              widget.nameController.text = domain.name;
              widget.descriptionController.text = domain.description;

              valuesControllers = List.filled(
                domain.values.length,
                TextEditingController(),
                growable: true,
              );

              valuesControllers.setAll(
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
            name: 'New domain #${Random().nextInt(1000)}',
            description: '',
            dataType: DataType.int,
            values: [],
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
        controller: widget.nameController,
        onChanged: (value) {
          setState(() {
            _selected!.name = value;
          });
        },
      ),
      TextField(
        controller: widget.descriptionController,
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
            valuesControllers.add(TextEditingController());
          });
        },
      ),
      for (var i = 0; i < _selected!.values.length; i++)
        TextField(
          controller: valuesControllers[i],
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
