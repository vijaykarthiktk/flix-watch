import '../../models/people/crew_model.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/constants.dart';

class CrewService {
  final ApiClient _apiClient;

  CrewService(this._apiClient);

  Future<List<CrewModel>> getCrew(String movieId) async {
    try {
      final response = await _apiClient.get(Constants.movieCreditsEndpoint,
          movieID: movieId);
      final results = response.data['crew'] as List;
      return results.map((crew) => CrewModel.fromJson(crew)).toList();
    } catch (e, s) {
      throw UnknownFailure('Failed to fetch crew: ${e.toString()}',
          stackTrace: s);
    }
  }
}
