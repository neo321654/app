import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../domain/entities/add_child_request_entity.dart';
import '../bloc/add_child/add_child_bloc.dart';
import '../bloc/add_child_form/add_child_form_cubit.dart';

class AddChild extends StatefulWidget {
  final VoidCallback? onChildAdded;

  const AddChild({
    Key? key,
    this.onChildAdded,
  }) : super(key: key);

  @override
  State<AddChild> createState() => _ChildItemState();
}

class _ChildItemState extends State<AddChild> {
  late TextEditingController birthdateTextController;
  late TextEditingController nameTextController;

  late AddChildFormCubit addChildFormCubit;

  @override
  void initState() {
    addChildFormCubit = AddChildFormCubit();

    birthdateTextController = TextEditingController()..addListener(_validateBirthdate);
    nameTextController = TextEditingController()..addListener(_validateName);
    super.initState();
  }

  void _validateName() {
    addChildFormCubit.validName(nameTextController.text.isNotEmpty);
  }

  void _validateBirthdate() {
    addChildFormCubit.validName(birthdateTextController.text.isNotEmpty);
  }

  @override
  void dispose() {
    nameTextController.removeListener(_validateName);
    birthdateTextController.removeListener(_validateBirthdate);

    birthdateTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: addChildFormCubit,
        ),
        BlocProvider.value(
          value: getIt<AddChildBloc>(),
        ),
      ],
      child: RoundedContainer(
        header: Text(
          'Ваш ребёнок',
          style: AppStyles.headline,
        ),
        child: Column(
          children: [
            const SizedBox(height: 28),
            InputText(
              label: 'Имя',
              controller: nameTextController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 12),
            InputText(
              label: 'Дата рождения',
              controller: birthdateTextController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  locale: const Locale("ru"),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
                  setState(() {
                    birthdateTextController.text = formattedDate;

                    addChildFormCubit.validBirtday(true);
                  });
                } else {
                  //print("Date is not selected");
                }
              },
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: BlocBuilder<AddChildBloc, AddChildState>(
                builder: (context, addChildState) {
                  return BlocBuilder<AddChildFormCubit, AddChildFormState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.nameValid && state.birthDateValid && addChildState is! Loading
                            ? () {
                          context.read<AddChildBloc>().add(
                            AddChildEvent.add(
                              AddChildRequestEntity(
                                name: nameTextController.text,
                                birthdate: DateFormat('dd.MM.yyyy').parse(
                                  birthdateTextController.text,
                                ),
                              ),
                            ),
                          );
                          widget.onChildAdded?.call();
                        }
                            : null,
                        child: addChildState.maybeMap(
                          loading: (value) => const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2,
                            ),
                          ),
                          orElse: () => const Text(
                            'Сохранить',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
