import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ChatMessageModel.dart';

class ChatbotController extends GetxController {
  // ---- UI state ----------------------------------------------------
  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;
  final RxBool isSending = false.obs; // spinner on the send button
  final RxBool isBotTyping = false.obs; // "Juno is typing..." bubble
  final RxBool isListening = false.obs; // mic actively recording

  // TODO: replace with the real signed-in user's name (auth/profile module)
  final String userName = 'Sohan';

  bool get hasMessages => messages.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // Flip this to `true` to preview the populated chat state (Image 2)
    // without hitting the network. Leave `false` so real users always
    // start on the empty "Meet Juno" welcome state (Image 1).
    const bool previewWithDummyData = false;
    if (previewWithDummyData) _loadDummyConversation();
  }

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  // ---- Dummy conversation (matches the reference screenshot) -------
  void _loadDummyConversation() {
    final now = DateTime.now();
    messages.addAll([
      ChatMessageModel(id: '1', text: 'Hi', isUser: true, timestamp: now),
      ChatMessageModel(
        id: '2',
        text: "Hey $userName.\nWhat's up — work mode or chill mode today?",
        isUser: false,
        timestamp: now,
      ),
      ChatMessageModel(id: '3', text: 'I am feel alone', isUser: true, timestamp: now),
      ChatMessageModel(
        id: '4',
        text:
        "I hear you, $userName. Feeling alone can be heavy, even if nothing specific happened. Do you want to just talk and keep your mind engaged, or do you want me to help you explore why you're feeling this way right now?",
        isUser: false,
        timestamp: now,
      ),
    ]);
  }

  // ---- Sending a message --------------------------------------------
  Future<void> sendMessage() async {
    final text = inputController.text.trim();
    if (text.isEmpty || isSending.value) return;

    messages.add(ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    ));
    inputController.clear();
    _scrollToBottom();

    await _requestBotReply(text);
  }

  Future<void> _requestBotReply(String userText) async {
    isSending.value = true;
    isBotTyping.value = true;
    try {
      // ------------------------------------------------------------------
      // TODO(api): swap this block for the real call, e.g.
      //
      // final reply = await ChatRepository.sendMessage(
      //   message: userText,
      //   history: messages.map((m) => m.toJson()).toList(),
      // );
      // messages.add(ChatMessageModel.fromJson(reply));
      //
      // ChatRepository would hit something like POST /chat with the
      // conversation history and return Juno's next message.
      // ------------------------------------------------------------------
      await Future.delayed(const Duration(milliseconds: 900)); // simulated latency
      final dummyReply = _mockReply(userText);

      messages.add(ChatMessageModel(
        id: '${DateTime.now().millisecondsSinceEpoch}_bot',
        text: dummyReply,
        isUser: false,
        timestamp: DateTime.now(),
      ));
    } catch (e) {
      messages.add(ChatMessageModel(
        id: '${DateTime.now().millisecondsSinceEpoch}_err',
        text: "Hmm, I couldn't respond just now. Please try again.",
        isUser: false,
        timestamp: DateTime.now(),
        isError: true,
      ));
    } finally {
      isBotTyping.value = false;
      isSending.value = false;
      _scrollToBottom();
    }
  }

  /// Placeholder "brain" so the UI is fully demo-able before the backend
  /// exists. Delete once `_requestBotReply` calls the real API.
  String _mockReply(String userText) {
    final lower = userText.toLowerCase();
    if (lower.contains('alone') || lower.contains('sad') || lower.contains('down')) {
      return "I hear you, $userName. Feeling alone can be heavy, even if nothing specific happened. "
          "Do you want to just talk and keep your mind engaged, or do you want me to help you explore why you're feeling this way right now?";
    }
    if (lower.contains('hi') || lower.contains('hello') || lower.contains('hey')) {
      return "Hey $userName.\nWhat's up — work mode or chill mode today?";
    }
    if (lower.contains('happy') || lower.contains('good') || lower.contains('great')) {
      return "Love hearing that, $userName! What's contributing to the good mood today?";
    }
    return "Got it. Tell me a bit more about what's on your mind.";
  }

  // ---- Voice input ----------------------------------------------------
  void toggleVoiceInput() {
    // TODO(voice): wire up speech_to_text / your voice-journaling package here.
    isListening.value = !isListening.value;
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }
}