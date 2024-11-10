import '../../../domain/entities/people.dart';

class PeopleDetailsModel extends People {
  final List<String> alsoKnownAs;
  final String biography;
  final DateTime birthday;
  final DateTime deathDay;
  final String homepage;
  final String imdbId;
  final String placeOfBirth;

  PeopleDetailsModel({
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathDay,
    required this.homepage,
    required this.imdbId,
    required this.placeOfBirth,
    required super.id,
    required super.name,
    required super.profilePath,
    required super.adult,
    required super.gender,
    required super.knownForDepartment,
    required super.popularity,
  });

  factory PeopleDetailsModel.fromJson(Map<String, dynamic> json) {
    return PeopleDetailsModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      alsoKnownAs: List<String>.from(json['also_known_as']),
      biography: json['biography'],
      birthday: DateTime.parse(json['birthday']),
      deathDay: json['deathday'],
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      placeOfBirth: json['place_of_birth'],
      adult: json['adult'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      popularity: json['popularity'],
    );
  }
}
