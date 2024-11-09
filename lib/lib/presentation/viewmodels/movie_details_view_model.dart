import 'package:flixwatch/data/models/movie_details_model.dart';
import 'package:flutter/foundation.dart';

import '../../../data/repositories/movie_repository.dart';

enum MovieDetailsState { initial, loading, loaded, error }

class MovieDetailsViewModel with ChangeNotifier {
  final MovieRepository _repository;
  MovieDetailsModel? _movieDetails;
  MovieDetailsState _state = MovieDetailsState.initial;
  String _error = '';

  MovieDetailsViewModel(this._repository);

  // Getters
  MovieDetailsModel? get movieDetails => _movieDetails;
  MovieDetailsState get state => _state;
  String get error => _error;
  bool get isLoading => _state == MovieDetailsState.loading;

  Future<void> loadMovieDetails(String movieId) async {
    try {
      _state = MovieDetailsState.loading;
      notifyListeners();

      _movieDetails = await _repository.getMovieDetails(movieId);
      _state = MovieDetailsState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = MovieDetailsState.error;
    } finally {
      notifyListeners();
    }
  }

  void retry(String movieId) {
    loadMovieDetails(movieId);
  }
}