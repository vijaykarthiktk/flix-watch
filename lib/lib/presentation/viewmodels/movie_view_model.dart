import 'package:flutter/foundation.dart';
import '../../../data/repositories/movie_repository.dart';
import '../../../domain/entities/movie.dart';

enum MovieState { initial, loading, loaded, error }

class MovieViewModel with ChangeNotifier {
  final MovieRepository _repository;
  List<Movie> _movies = [];
  MovieState _state = MovieState.initial;
  String _error = '';

  MovieViewModel(this._repository);

  // Getters
  List<Movie> get movies => _movies;
  MovieState get state => _state;
  String get error => _error;
  bool get isLoading => _state == MovieState.loading;

  Future<void> loadMovies() async {
    try {
      _state = MovieState.loading;
      notifyListeners();

      _movies = await _repository.getPopularMovies();
      _state = MovieState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = MovieState.error;
    } finally {
      notifyListeners();
    }
  }

  void retry() {
    loadMovies();
  }
}