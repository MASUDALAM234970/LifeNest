class MusicModel {
  final int id;
  final String title;
  final String artist;
  final String musicFile;
  final String banner;
  final String category;
  final DateTime uploadedAt;

  MusicModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.musicFile,
    required this.banner,
    required this.category,
    required this.uploadedAt,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'],
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      musicFile: json['music_file'] ?? '',
      banner: json['banner'] ?? '',
      category: json['category'] ?? '',
      uploadedAt: DateTime.parse(json['uploaded_at']),
    );
  }
}