import 'package:flutter/cupertino.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../core/widgets/text_area.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    controller.text = 'Тест! Не готовить!';
    return RoundedContainer(
      header: Text(
        'Комментарий',
        style: AppStyles.headline,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextArea(
            scrollPadding: const EdgeInsets.only(bottom: 220),
            controller: controller,
            maxLines: 2,
            maxLength: 150,
            hintText: 'Напишите пожелания или пояснения\nк вашему заказу',
          ),
        ],
      ),
    );
  }
}
