import 'package:flutter/material.dart';

import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'domain_card.dart';

class DomainsView extends StatelessWidget {
  const DomainsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Domain name',
      description: 'Domain description',
      children: [
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
      itemBuilder: (_, index) => DomainCard(index: index),
      onDelete: () {},
    );
  }
}
