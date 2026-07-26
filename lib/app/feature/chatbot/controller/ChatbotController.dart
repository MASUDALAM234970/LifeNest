import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/networks/api_client.dart';
import '../../../core/conts/endpoints.dart';
import '../models/ChatMessageModel.dart';

class ChatbotController extends GetxController {
  final RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;
  final RxBool isSending = false.obs;
  final RxBool isBotTyping = false.obs;
  final RxBool isListening = false.obs;

  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool get hasMessages => messages.isNotEmpty;

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void toggleVoiceInput() {
    isListening.value = !isListening.value;
  }

  Future<void> sendMessage() async {
    final text = inputController.text.trim();

    if (text.isEmpty || isSending.value) return;

    inputController.clear();

    // Add user message
    messages.add(
      ChatMessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ),
    );

    _scrollToBottom();

    isSending.value = true;
    isBotTyping.value = true;

    try {
      final Map<String, dynamic> response =
      await ApiClient.instance.post(
        Endpoints.chatbot,
        body: {
          "message": text,
        },
      );

      debugPrint("Response: $response");

      if (response["success"] == true) {
        final reply = (response["reply"] ?? "").toString();

        messages.add(
          ChatMessageModel(
            id: "${DateTime.now().millisecondsSinceEpoch}_bot",
            text: reply,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      } else {
        _appendError(
          response["message"]?.toString() ?? "Something went wrong.",
        );
      }
    } catch (e) {
      debugPrint("Chat Error: $e");
      _appendError("Network Error");
    } finally {
      isSending.value = false;
      isBotTyping.value = false;
      _scrollToBottom();
    }
  }

  void _appendError(String errorText) {
    messages.add(
      ChatMessageModel(
        id: "${DateTime.now().millisecondsSinceEpoch}_error",
        text: errorText,
        isUser: false,
        isError: true,
        timestamp: DateTime.now(),
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void clearChat() {
    messages.clear();
  }
}