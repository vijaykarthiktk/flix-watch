import 'package:flixwatch/core/utils/constants.dart';

import '../../../domain/entities/people.dart';

class CastModel extends People {
  final String originalName;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  CastModel({
    required this.originalName,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.popularity,
    required super.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      originalName: json['original_name'] as String,
      castId: json['cast_id'] as int,
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      popularity: json['popularity'] as double,
      profilePath: (json['profile_path'] ?? null),
    );
  }

  Map<String, dynamic> toJson() => {
        'original_name': originalName,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  @override
  String toString() {
    return 'CastModel{originalName: $originalName, castId: $castId, character: $character, creditId: $creditId, order: $order}';
  }

  get fullProfilePath => profilePath != null ? '${Constants.logoBaseUrl}$profilePath' : null;

}
