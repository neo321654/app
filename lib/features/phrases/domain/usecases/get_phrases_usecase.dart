import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/core/usecase/usecase.dart';
import 'package:monobox/features/phrases/domain/entities/phrase.dart';
import 'package:monobox/features/phrases/domain/repositories/phrases_repository.dart';

class GetPhrasesUseCase implements UseCase<DataState<List<Phrase>>, void> {
  final PhrasesRepository _phrasesRepository;

  GetPhrasesUseCase(this._phrasesRepository);

  @override
  Future<DataState<List<Phrase>>> call({void params}) {
    return _phrasesRepository.getPhrases();
  }
}
