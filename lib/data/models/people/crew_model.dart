import '../../../core/utils/constants.dart';
import '../../../domain/entities/people.dart';

class CrewModel extends People {
  final String originalName;
  final String creditId;
  final String department;
  final String job;

  CrewModel({
    required super.id,
    required this.originalName,
    required this.creditId,
    required this.department,
    required this.job,
    required super.name,
    required super.popularity,
    required super.profilePath,
    required super.knownForDepartment,
    required super.gender,
    required super.adult,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      id: json['id'],
      adult: json['adult'],
      name: json['name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      knownForDepartment: json['known_for_department'],
      gender: json['gender'],
      originalName: json['original_name'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'popularity': popularity,
      'profile_path': profilePath,
      'known_for_department': knownForDepartment,
      'gender': gender,
      'original_name': originalName,
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
  }

  get fullProfilePath => profilePath != null ? '${Constants.logoBaseUrl}$profilePath' : null;

}