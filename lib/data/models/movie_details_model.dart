import '../../core/utils/constants.dart';
import '../../domain/entities/movie.dart';

class MovieDetailsModel extends Movie {
  final List<GenreModel> genres;
  final String homepage;
  final String imdbId;
  final List<String> originCountry;
  final List<ProductionCompanyModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final List<SpokenLanguageModel> spokenLanguages;

  final int budget;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;

  MovieDetailsModel({
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.genres,
    required this.homepage,
    required this.imdbId,
    required this.originCountry,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.releaseDate,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required super.posterPath,
    required super.backdropPath,
    required super.adult,
    required super.video,
    required super.genreIds,
    required super.originalLanguage,
  }) : super();

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      video: json['video'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      genres: List<GenreModel>.from(
          json['genres'].map((x) => GenreModel.fromJson(x))),
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      productionCompanies: List<ProductionCompanyModel>.from(
          json['production_companies']
              .map((x) => ProductionCompanyModel.fromJson(x))),
      productionCountries: List<ProductionCountryModel>.from(
          json['production_countries']
              .map((x) => ProductionCountryModel.fromJson(x))),
      spokenLanguages: List<SpokenLanguageModel>.from(
          json['spoken_languages'].map((x) => SpokenLanguageModel.fromJson(x))),
      genreIds: [],
      originalLanguage: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'release_date': releaseDate,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'adult': adult,
      'video': video,
      'budget': budget,
      'revenue': revenue,
      'runtime': runtime,
      'status': status,
      'tagline': tagline,
      'genres': genres.map((x) => x.toJson()).toList(),
      'homepage': homepage,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'production_companies':
          productionCompanies.map((x) => x.toJson()).toList(),
      'production_countries':
          productionCountries.map((x) => x.toJson()).toList(),
      'spoken_languages': spokenLanguages.map((x) => x.toJson()).toList(),
    };
  }

  String get logoBaseUrl =>
      '${Constants.logoBaseUrl}$backdropPath';
}

class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class ProductionCompanyModel {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompanyModel({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      logoPath: json['logo_path'] ?? "",
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}

class ProductionCountryModel {
  final String iso31661;
  final String name;

  ProductionCountryModel({required this.iso31661, required this.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {'iso_3166_1': iso31661, 'name': name};
}

class SpokenLanguageModel {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageModel({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }
}
