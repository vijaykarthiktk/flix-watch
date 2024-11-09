import '../models/movie_details_model.dart';
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

  Future<MovieDetailsModel> getMovieDetails(String movieID) async {
    try {
      return await _movieService.getMovieDetails(movieID);
    } catch (e) {
      rethrow;
    }
  }
}