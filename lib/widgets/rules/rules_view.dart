import 'package:flutter/material.dart';

import 'rule_card.dart';

class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildList(context)),
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
            controller: TextEditingController()..text = 'Rule Name',
          ),
          TextField(
            controller: TextEditingController()..text = 'Rule description',
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Conditions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  splashRadius: 24,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          _buildCondition(),
          // Logic operation between expressions.
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 4),
          //   child: DropdownButton<String>(
          //     value: 'and',
          //     onChanged: (s) {},
          //     items: [
          //       DropdownMenuItem(child: Text('and'), value: 'and'),
          //       DropdownMenuItem(child: Text('or'), value: 'or'),
          //     ],
          //   ),
          // ),
          _buildCondition(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Facts',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  splashRadius: 24,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          _buildFact(),
          _buildFact(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Delete'),
          )
        ],
      ),
    );
  }

  Widget _buildCondition() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First operand.
          DropdownButton<String>(
            value: 'var1',
            onChanged: (s) {},
            items: const [
              DropdownMenuItem(child: Text('var1'), value: 'var1'),
              DropdownMenuItem(child: Text('var2'), value: 'var2'),
            ],
          ),
          // Comparison operation between operands.
          // DropdownButton<String>(
          //   value: '=',
          //   onChanged: (s) {},
          //   items: [
          //     DropdownMenuItem(child: Text('='), value: '='),
          //     DropdownMenuItem(child: Text('!='), value: '!='),
          //   ],
          // ),
          const Text('='),
          // Second operand.
          DropdownButton<String>(
            value: 'var1',
            onChanged: (s) {},
            items: const [
              DropdownMenuItem(child: Text('var1'), value: 'var1'),
              DropdownMenuItem(child: Text('var2'), value: 'var2'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFact() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Variable.
          DropdownButton<String>(
            value: 'var1',
            onChanged: (s) {},
            items: const [
              DropdownMenuItem(child: Text('var1'), value: 'var1'),
              DropdownMenuItem(child: Text('var2'), value: 'var2'),
            ],
          ),
          const Text('='),
          // Value to assign.
          DropdownButton<String>(
            value: 'var1',
            onChanged: (s) {},
            items: const [
              DropdownMenuItem(child: Text('var1'), value: 'var1'),
              DropdownMenuItem(child: Text('var2'), value: 'var2'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: 20,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return RuleCard(index: index);
        // return _buildExpandableRuleCard();
      },
    );
  }
}
