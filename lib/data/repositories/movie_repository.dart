import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieRepository {
  final MovieService _movieService;

  MovieRepository(this._movieService);

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      return await _movieService.getPopularMovies();
    } catch (e) {
      rethrow;
    }
  }
}