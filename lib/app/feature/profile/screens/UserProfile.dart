class UserProfile {
  final String name;
  final String email;
  final String dateOfBirth;
  final String? gender;
  final String? occupation;
  final int age;
  final String profilePictureUrl;

  const UserProfile({
    required this.name,
    required this.email,
    required this.dateOfBirth,
    this.gender,
    this.occupation,
    required this.age,
    required this.profilePictureUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    const String baseUrl = "https://yourdomain.com"; // <-- change this

    return UserProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      gender: json['gender'],
      occupation: json['occupation'],
      age: json['age'] ?? 0,
      profilePictureUrl: json['profile_picture'] != null
          ? '$baseUrl${json['profile_picture']}'
          : '',
    );
  }
}
