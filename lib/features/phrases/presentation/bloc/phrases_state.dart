part of 'phrases_bloc.dart';

@freezed
class PhrasesState with _$PhrasesState {
  const factory PhrasesState.initial() = _Initial;
  const factory PhrasesState.loading() = _Loading;
  const factory PhrasesState.success(List<Phrase> phrases) = _Success;
  const factory PhrasesState.error(Object error) = _Error;
}
