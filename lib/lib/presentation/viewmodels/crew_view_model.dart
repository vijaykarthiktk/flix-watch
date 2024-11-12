import '../../../data/models/people/crew_model.dart';
import '../../../data/repositories/people/crew_repository.dart';
import 'package:flutter/foundation.dart';

enum CrewDetailsState  { initial, loading, loaded, error }

class CrewViewModel extends ChangeNotifier {
  final CrewRepository _repository;
  CrewViewModel(this._repository);

  CrewDetailsState _state = CrewDetailsState.initial;
  CrewDetailsState get state => _state;
  bool get isLoading => _state == CrewDetailsState.loading;

  List<CrewModel> _crew = [];
  List<CrewModel> get crew => _crew;

  String _error = '';
  String get error => _error;

  Future<void> loadCrew(String movieId) async {
    try {
      _state = CrewDetailsState.loading;
      notifyListeners();

      _crew = await _repository.getCrew(movieId);
      _crew.sort((a, b) => a.popularity.compareTo(b.popularity));
      _state = CrewDetailsState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = CrewDetailsState.error;
    } finally {
      notifyListeners();
    }
  }

  void retry(String movieId) {
    loadCrew(movieId);
  }
}