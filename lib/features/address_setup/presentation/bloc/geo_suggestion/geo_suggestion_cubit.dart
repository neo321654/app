import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/address_setup/domain/usecases/params/geo_suggestion_params.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/geo_suggestion_entity.dart';
import '../../../domain/usecases/geo_suggestion_usecase.dart';

part 'geo_suggestion_state.dart';
part 'geo_suggestion_cubit.freezed.dart';

class GeoSuggestionCubit extends Cubit<GeoSuggestionState> {
  final GeoSuggestionUsecase _usecase;
  GeoSuggestionCubit(this._usecase) : super(const GeoSuggestionState());

  void search(
    String city,
    String search,
  ) async {
    try {
      final dataState = await _usecase(
          params: GeoSuggestionParams(city: city, search: search));

      if (dataState is DataSuccess && dataState.data != null) {
        emit(GeoSuggestionState(suggestions: dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(
          const GeoSuggestionState(suggestions: []),
        );
      }
    } catch (message) {
      emit(
        const GeoSuggestionState(suggestions: []),
      );
    }
  }
}
