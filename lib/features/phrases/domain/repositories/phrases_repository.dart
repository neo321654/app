import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/phrases/domain/entities/phrase.dart';

abstract class PhrasesRepository {
  Future<DataState<List<Phrase>>> getPhrases();
}
