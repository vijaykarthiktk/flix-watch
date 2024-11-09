import 'package:flixwatch/core/error/failures.dart';
import 'package:flixwatch/core/utils/constants.dart';
import 'package:flixwatch/data/models/movie_details_model.dart';

import '../../core/network/api_client.dart';
import '../models/movie_model.dart';

class MovieService {
  final ApiClient _apiClient;

  MovieService(this._apiClient);

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _apiClient.get(Constants.popularMoviesEndpoint);
      final results = response.data['results'] as List;
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    } catch (e) {
      throw UnknownFailure('Failed to fetch popular movies: ${e.toString()}');
    }
  }

  Future<MovieDetailsModel> getMovieDetails(String movieID) async {
    try {
      final response = await _apiClient.get(Constants.movieDetailsEndpoint,
          movieID: movieID);
      return MovieDetailsModel.fromJson(response.data);
    } catch (e) {
      throw UnknownFailure('Failed to fetch movie: ${e.toString()}');
    }
  }
}
