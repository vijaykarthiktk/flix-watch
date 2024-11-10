import 'package:flixwatch/data/services/people/cast_service.dart';

import '../../models/people/cast_model.dart';

abstract class CastRepository {
  Future<List<CastModel>> getCast(String movieId);
}

class CastRepositoryImpl implements CastRepository {
  final CastService _castService;

  CastRepositoryImpl(this._castService);

  @override
  Future<List<CastModel>> getCast(String movieId) async {
    try {
      return await _castService.getCast(movieId);
    } catch (e) {
      rethrow;
    }
  }
}