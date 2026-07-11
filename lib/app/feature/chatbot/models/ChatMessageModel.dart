/// Simple immutable model representing a single chat bubble.
/// Kept intentionally small right now — when the real API is wired up,
/// this is where you'd add fields like `emotionTag`, `audioUrl`,
/// `status` (sending/sent/failed), etc.
class ChatMessageModel {
  final String id;
  final String text;
  final bool isUser; // true = Sohan's bubble (right), false = Juno's bubble (left)
  final DateTime timestamp;
  final bool isError;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isError = false,
  });

  /// Handy once the backend is live — map straight from the API response.
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'].toString(),
      text: json['text'] ?? json['message'] ?? '',
      isUser: json['role'] == 'user' || json['isUser'] == true,
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'role': isUser ? 'user' : 'assistant',
    'timestamp': timestamp.toIso8601String(),
  };
}