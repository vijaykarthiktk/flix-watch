import 'package:flutter/foundation.dart';
import '../../../data/models/people/cast_model.dart';
import '../../../data/repositories/people/cast_repository.dart';

enum CastDetailsState  { initial, loading, loaded, error }

class CastViewModel extends ChangeNotifier {
  final CastRepository _repository;
  CastViewModel(this._repository);

  CastDetailsState _state = CastDetailsState.initial;
  CastDetailsState get state => _state;
  bool get isLoading => _state == CastDetailsState.loading;

  List<CastModel> _cast = [];
  List<CastModel> get cast => _cast;

  String _error = '';
  String get error => _error;

  Future<void> loadCast(String movieId) async {
    try {
      _state = CastDetailsState.loading;
      notifyListeners();

      _cast = await _repository.getCast(movieId);
      _state = CastDetailsState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = CastDetailsState.error;
    } finally {
      notifyListeners();
    }
  }

  void retry(String movieId) {
    loadCast(movieId);
  }
}