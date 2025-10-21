part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  final MenuResponse? menuResponse;
  final DioException? error;

  const MenuState({this.menuResponse, this.error});

  @override
  List<Object> get props {
    final props = <Object>[];
    if (menuResponse != null) {
      props.add(menuResponse!);
    }
    if (error != null) {
      props.add(error!);
    }
    return props;
  }
}

class MenuLoading extends MenuState {
  const MenuLoading();
}

class MenuDone extends MenuState {
  const MenuDone(MenuResponse menuResponse) : super(menuResponse: menuResponse);
}

class MenuError extends MenuState {
  const MenuError(DioException error) : super(error: error);
}
