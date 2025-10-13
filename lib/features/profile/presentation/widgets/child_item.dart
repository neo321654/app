import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:monobox/config/themes/styles.dart';

import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../domain/entities/child_entity.dart';

class ChildItem extends StatefulWidget {
  const ChildItem({
    super.key,
    required this.child,
  });

  final ChildEntity child;

  @override
  State<ChildItem> createState() => _ChildItemState();
}

class _ChildItemState extends State<ChildItem> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController(
        text: DateFormat('dd.MM.yyyy').format(widget.child.birthdate));
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RoundedContainer(
        header: Text(
          widget.child.name,
          style: AppStyles.headline,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            InputText(
              label: 'Дата рождения',
              controller: textController,
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
