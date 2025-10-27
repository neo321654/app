import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/phrases/domain/entities/phrase.dart';
import 'package:monobox/features/phrases/domain/usecases/get_phrases_usecase.dart';

part 'phrases_bloc.freezed.dart';
part 'phrases_event.dart';
part 'phrases_state.dart';

class PhrasesBloc extends Bloc<PhrasesEvent, PhrasesState> {
  final GetPhrasesUseCase _getPhrasesUseCase;

  PhrasesBloc(this._getPhrasesUseCase) : super(const PhrasesState.initial()) {
    on<GetPhrases>(_onGetPhrases);
  }

  void _onGetPhrases(GetPhrases event, Emitter<PhrasesState> emit) async {
    emit(const PhrasesState.loading());
    final dataState = await _getPhrasesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(PhrasesState.success(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(PhrasesState.error(dataState.error!));
    }
  }
}
