import '../../models/people/crew_model.dart';

import '../../services/people/crew_service.dart';

abstract class CrewRepository {
  Future<List<CrewModel>> getCrew(String movieId);
}

class CrewRepositoryImpl implements CrewRepository {
  final CrewService _crewService;

  CrewRepositoryImpl(this._crewService);

  @override
  Future<List<CrewModel>> getCrew(String movieId) async {
    try {
      return await _crewService.getCrew(movieId);
    } catch (e) {
      rethrow;
    }
  }
}
