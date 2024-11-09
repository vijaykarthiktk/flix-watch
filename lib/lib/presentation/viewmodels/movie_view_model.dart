import 'package:flutter/foundation.dart';
import '../../../data/repositories/movie_repository.dart';
import '../../../domain/entities/movie.dart';

class MovieViewModel with ChangeNotifier {
  final MovieRepository _repository;
  List<Movie> _movies = [];
  String _error = '';

  MovieViewModel(this._repository);

  // Getters
  List<Movie> get movies => _movies;
  String get error => _error;

  Future<void> loadMovies() async {
    try {
      notifyListeners();

      _movies = await _repository.getPopularMovies();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void retry() {
    loadMovies();
  }
}