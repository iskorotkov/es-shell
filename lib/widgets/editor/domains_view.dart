import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/domain.dart';
import '../../model/project.dart';
import '../../utils/name_generator.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import '../common/reorder_items.dart';
import '../homepage.dart';
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
  bool _firstRender = true;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();
    var nameGenerator = context.read<NameGenerator>();
    var tabContext = context.read<TabContext>();

    var mustScrollToElement = _firstRender && tabContext.entityGuid != null;
    if (mustScrollToElement) {
      Future.microtask(() {
        setState(() {
          var matched = project.domains
              .where((element) => element.uuid == tabContext.entityGuid);
          if (matched.isNotEmpty) {
            _select(matched.first);
          }

          _firstRender = false;
        });
      });
    }

    return Provider<ScrollState?>.value(
      value: _selected != null
          ? ScrollState(index: project.domains.indexOf(_selected!))
          : null,
      child: CustomView<Domain>(
        sidebar: _selected != null ? _buildSidebar(project) : [],
        items: project.domains,
        itemBuilder: (_, domain) => ChangeNotifierProvider<Domain>.value(
          key: Key(domain.uuid),
          value: domain,
          child: DomainCard(
            selected: _selected == domain,
            onTap: () {
              setState(() {
                _select(domain);

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
            name: nameGenerator.generate(
                'Domain', project.domains.map((e) => e.name).toList()),
            description: '',
            values: const [],
          );

          if (_selected == null) {
            project.domains = [...project.domains, created];
          } else {
            var index = project.domains.indexOf(_selected!);
            project.domains = [
              ...project.domains.sublist(0, index + 1),
              created,
              ...project.domains.sublist(index + 1)
            ];
          }
        },
        onDelete: () {
          var variablesWithDomain =
              project.variables.where((e) => e.domain == _selected);
          if (variablesWithDomain.isNotEmpty) {
            var names =
                variablesWithDomain.map((e) => '"${e.name}"').join(', ');

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

          project.domains =
              project.domains.where((element) => element != _selected).toList();

          setState(() {
            _selected = null;
          });
        },
        onClose: () {
          setState(() {
            _selected = null;
          });
        },
      ),
    );
  }

  void _select(Domain domain) {
    _selected = domain;
    widget._nameController.text = domain.name;
    widget._descriptionController.text = domain.description;
  }

  Widget _buildDomainValue(Project project, int index) {
    return Row(
      key: Key(index.toString()),
      children: [
        Expanded(
          child: TextField(
            controller: _valuesControllers[index],
            onChanged: (value) {
              _selected!.values = _selected!.values
                  .map((e) => e == _selected!.values[index] ? value : e)
                  .toList();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              var curValue = _selected!.values[index];
              var rulesWithValue = project.rules.where((element) =>
                  element.conditions
                      .any((element) => element.value == curValue) ||
                  element.results.any((element) => element.value == curValue));

              if (rulesWithValue.isNotEmpty) {
                var joinedRuleNames =
                    rulesWithValue.map((e) => '"${e.name}"').join(", ");

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Can\'t delete domain'),
                    content: Text(
                        'Domain value "$curValue" is used in rule${rulesWithValue.length == 1 ? '' : 's'} $joinedRuleNames'),
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

              _selected!.values = [
                ..._selected!.values.sublist(0, index),
                ..._selected!.values.sublist(index + 1)
              ];

              setState(() {
                _valuesControllers = [
                  ..._valuesControllers.sublist(0, index),
                  ..._valuesControllers.sublist(index + 1)
                ];
              });
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSidebar(Project project) {
    return [
      TextField(
        controller: widget._nameController,
        onChanged: (value) {
          _selected!.name = value;
        },
        decoration: const InputDecoration(hintText: 'Enter name...'),
      ),
      TextField(
        controller: widget._descriptionController,
        onChanged: (value) {
          _selected!.description = value;
        },
        decoration: const InputDecoration(hintText: 'Enter description...'),
      ),
      Builder(builder: (context) {
        return CustomViewHeading(
          text: 'Values',
          onAdd: () {
            var nameGenerator = context.read<NameGenerator>();
            var name = nameGenerator.generate(
                'Value', _valuesControllers.map((e) => e.text).toList());

            _selected!.values = [..._selected!.values, name];
            setState(() {
              _valuesControllers.add(TextEditingController()..text = name);
            });
          },
        );
      }),
      ReorderableListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildDomainValue(project, index);
        },
        itemCount: _selected!.values.length,
        onReorder: (oldIndex, newIndex) {
          var values = [..._selected!.values];
          reorderItems(values, oldIndex, newIndex);
          _selected!.values = values;

          setState(() {
            reorderItems(_valuesControllers, oldIndex, newIndex);
          });
        },
      ),
    ];
  }
}
