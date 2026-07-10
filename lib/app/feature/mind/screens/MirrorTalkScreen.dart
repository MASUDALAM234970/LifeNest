import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../../constant/AppTextStyle.dart';


class MirrorTalkScreen extends StatefulWidget {
  const MirrorTalkScreen({super.key});

  @override
  State<MirrorTalkScreen> createState() => _MirrorTalkScreenState();
}

class _MirrorTalkScreenState extends State<MirrorTalkScreen> {
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  String _sentence = '';           // what the user said, live-updating
  String _capturedLocaleId = '';   // locale used to recognize the speech
  bool _isListening = false;
  bool _isSpeaking = false;
  bool _speechAvailable = false;

  @override
  void initState() {
    super.initState();
    _tts.setStartHandler(() => setState(() => _isSpeaking = true));
    _tts.setCompletionHandler(() => setState(() => _isSpeaking = false));
    _tts.setCancelHandler(() => setState(() => _isSpeaking = false));
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    _speechAvailable = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
        }
      },
      onError: (_) => setState(() => _isListening = false),
    );
    setState(() {});
  }

  Future<void> _toggleRecording() async {
    if (_isListening) {
      await _speech.stop();
      setState(() => _isListening = false);
      return;
    }

    if (!_speechAvailable) {
      await _initSpeech();
      if (!_speechAvailable) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Speech recognition not available')),
        );
        return;
      }
    }

    setState(() {
      _isListening = true;
      _sentence = '';
    });

    // Passing localeId: null lets the plugin use the device's current
    // system language automatically — so it works for any language the
    // phone/user is set to speak in, with no hard-coded list.
    _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        setState(() {
          _sentence = result.recognizedWords;
        });
        if (result.finalResult) {
          setState(() => _isListening = false);
        }
      },
      localeId: null,
    );

    // Record which locale was actually used, so playback matches it.
    final systemLocale = await _speech.systemLocale();
    _capturedLocaleId = systemLocale?.localeId ?? '';
  }

  Future<void> _speakAloud() async {
    if (_sentence.trim().isEmpty) return;

    if (_isSpeaking) {
      await _tts.stop();
      return;
    }

    // Use the same locale that was used to capture the speech, so a
    // Bengali sentence is read back in Bengali, a Hindi one in Hindi, etc.
    if (_capturedLocaleId.isNotEmpty) {
      try {
        await _tts.setLanguage(_capturedLocaleId);
      } catch (_) {
        // Falls back to whatever the TTS engine's default is if the
        // exact locale isn't installed on the device.
      }
    }

    await _tts.setPitch(1.0);
    await _tts.setSpeechRate(0.45);
    await _tts.speak(_sentence);
  }

  void _clear() {
    setState(() {
      _sentence = '';
      _capturedLocaleId = '';
    });
  }

  @override
  void dispose() {
    _tts.stop();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasSentence = _sentence.trim().isNotEmpty;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB0148C),
              Color(0xFF7A1FC2),
              Color(0xFF5A21C7),
            ],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    _CircleIconButton(
                      icon: Icons.chevron_left,
                      onTap: () => Navigator.of(context).maybePop(),
                    ),
                    const Expanded(
                      child: Text(
                        'Mirror Talk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _CircleIconButton(
                      icon: Icons.close,
                      onTap: () => Navigator.of(context).maybePop(),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3D2E9C).withOpacity(0.55),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Stand or sit in front of a mirror. Say a sentence out '
                            'loud in any language — it will appear below, and you '
                            'can play it back.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.mango70016sos
                      ),
                      const SizedBox(height: 20),

                      // Sentence display card — filled ONLY by what the user says.
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 110),
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1548),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: hasSentence
                            ? Text(
                          _sentence,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        )
                            : Text(
                          _isListening
                              ? 'Listening…'
                              : 'Tap "Record" and say something.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: _ActionButton(
                              icon: _isListening ? Icons.stop : Icons.mic,
                              label: _isListening
                                  ? 'Listening…'
                                  : (hasSentence ? 'Record Again' : 'Record'),
                              onTap: _toggleRecording,
                              highlighted: _isListening,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ActionButton(
                              icon: _isSpeaking
                                  ? Icons.stop_circle_outlined
                                  : Icons.volume_up,
                              label: _isSpeaking ? 'Stop' : 'Speak Aloud',
                              onTap: hasSentence ? _speakAloud : () {},
                              disabled: !hasSentence,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _ActionButton(
                              icon: Icons.refresh,
                              label: 'Clear',
                              onTap: hasSentence ? _clear : () {},
                              disabled: !hasSentence,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ActionButton(
                              icon: Icons.check,
                              label: 'Done',
                              onTap: () => Navigator.of(context).maybePop(),
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;
  final bool highlighted;
  final bool disabled;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = false,
    this.highlighted = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color background = filled
        ? const Color(0xFF4C82F7)
        : (highlighted
        ? Colors.white.withOpacity(0.35)
        : Colors.white.withOpacity(0.18));

    return Opacity(
      opacity: disabled ? 0.4 : 1.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

