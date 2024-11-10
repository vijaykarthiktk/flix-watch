import '../../../core/error/failures.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/constants.dart';
import '../../models/people/cast_model.dart';

class CastService {
  final ApiClient _apiClient;

  CastService(this._apiClient);

  Future<List<CastModel>> getCast(String movieId) async {
    try {
      final response = await _apiClient.get(Constants.movieCreditsEndpoint, movieID: movieId);
      final results = response.data['cast'] as List;
      return results.map((cast) => CastModel.fromJson(cast)).toList();
    } catch (e, s) {
      throw UnknownFailure('Failed to fetch cast: ${e.toString()}', stackTrace: s);
    }
  }
}
