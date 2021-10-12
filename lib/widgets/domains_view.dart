import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_type.dart';
import '../model/domain.dart';
import '../model/project.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'domain_card.dart';

class DomainsView extends StatelessWidget {
  const DomainsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Domain>(
      sidebar: [
        TextField(
          controller: TextEditingController()..text = 'Domain name',
        ),
        TextField(
          controller: TextEditingController()..text = 'Domain description',
        ),
        const CustomViewHeading(text: 'Type'),
        DropdownButton<DataType>(
          value: DataType.int,
          onChanged: (s) {},
          items: DataType.values
              .map((e) => DropdownMenuItem(
            child: Text(e.name()),
            value: e,
          ))
              .toList(),
        ),
        CustomViewHeading(
          text: 'Values',
          onAdd: () {},
        ),
        TextField(
          controller: TextEditingController()..text = 'one',
        ),
        TextField(
          controller: TextEditingController()..text = 'two',
        ),
        TextField(
          controller: TextEditingController()..text = 'three',
        ),
        TextField(
          controller: TextEditingController()..text = 'four or more',
        ),
      ],
      items: project.domains,
      itemBuilder: (_, domain) => Provider<Domain>.value(
        value: domain,
        child: const DomainCard(),
      ),
      onDelete: () {},
    );
  }
}
