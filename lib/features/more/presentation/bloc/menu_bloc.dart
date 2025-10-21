import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/more/data/models/menu_response.dart';
import 'package:monobox/features/more/domain/usecases/get_menu.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetMenuUseCase _getMenuUseCase;

  MenuBloc(this._getMenuUseCase) : super(const MenuLoading()) {
    on<GetMenu>(onGetMenu);
  }

  void onGetMenu(GetMenu event, Emitter<MenuState> emit) async {
    final dataState = await _getMenuUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(MenuDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(MenuError(dataState.error!));
    }
  }
}
