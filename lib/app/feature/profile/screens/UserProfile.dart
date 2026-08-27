class UserProfile {
  final String name;
  final String email;
  final String dateOfBirth;
  final String? gender;
  final String? occupation;
  final int age;
  final String profilePictureUrl;
  final String lastLogin;

  const UserProfile({
    required this.name,
    required this.email,
    required this.dateOfBirth,
    this.gender,
    this.occupation,
    required this.age,
    required this.profilePictureUrl,
    required this.lastLogin,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    const String baseUrl =
        "https://lifenestbackend-production.up.railway.app";

    final profilePicture = json['profile_picture'];

    return UserProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      gender: json['gender'],
      occupation: json['occupation'],
      age: json['age'] ?? 0,

      profilePictureUrl: profilePicture != null &&
          profilePicture.toString().isNotEmpty
          ? '$baseUrl$profilePicture'
          : '',

      lastLogin: json['last_login'] ?? '',
    );
  }
}