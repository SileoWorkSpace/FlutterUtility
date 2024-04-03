import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextSearch extends StatefulWidget {
  const SpeechToTextSearch({super.key});

  @override
  State<SpeechToTextSearch> createState() => _SpeechToTextSearchState();
}

class _SpeechToTextSearchState extends State<SpeechToTextSearch> {
  final TextEditingController searchController = TextEditingController();
  String text = "Hold the button and start speaking";
  bool isListening = false;
  stt.SpeechToText speechToText = stt.SpeechToText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Speech To Text"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _searchTextWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarGlow(
                    glowShape: BoxShape.circle,
                    animate: isListening,
                    duration: const Duration(milliseconds: 2000),
                    glowColor: Colors.lightBlue,
                    repeat: true,
                    startDelay: const Duration(milliseconds: 100),
                    glowCount: 2,
                    glowRadiusFactor: 0.4,
                    child: GestureDetector(
                      onTap: () async {
                        if (!isListening) {
                          var available = await speechToText.initialize();
                          if (available) {
                            setState(() {
                              isListening = true;
                            });
                            speechToText.listen(
                                listenFor: const Duration(days: 1),
                                onResult: (result) {
                                  setState(() {
                                    text = result.recognizedWords;
                                  });
                                });
                          }
                        } else {
                          setState(() {
                            isListening = false;
                          });
                          speechToText.stop();
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 40,
                        child: Icon(
                          isListening ? Icons.mic : Icons.mic_off,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      color: isListening ? Colors.black87 : Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchTextWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x2B000000),
                    blurRadius: 18,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextField(
                controller: searchController,
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.text,
                maxLength: 100,
                autofocus: true,
                showCursor: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    counterText: "",
                    prefixIconConstraints:
                        BoxConstraints.loose(const Size(60, 28)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: Color(0xFF222222),
                      ),
                    ),
                    filled: true,
                    isDense: true,
                    fillColor: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(25.5),
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        insetPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 1,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AvatarGlow(
                                  glowShape: BoxShape.circle,
                                  animate: isListening,
                                  duration: const Duration(milliseconds: 2000),
                                  glowColor: Colors.lightBlue,
                                  repeat: true,
                                  startDelay: const Duration(milliseconds: 100),
                                  glowCount: 2,
                                  glowRadiusFactor: 0.4,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (!isListening) {
                                        var available =
                                            await speechToText.initialize();
                                        if (available) {
                                          setState(() {
                                            isListening = true;
                                          });
                                          speechToText.listen(
                                              listenFor:
                                                  const Duration(days: 1),
                                              onResult: (result) {
                                                setState(() {
                                                  text = result.recognizedWords;
                                                });
                                              });
                                        }
                                      } else {
                                        setState(() {
                                          isListening = false;
                                        });
                                        speechToText.stop();
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightBlue,
                                      radius: 40,
                                      child: Icon(
                                        isListening ? Icons.mic : Icons.mic_off,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                text,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: isListening
                                        ? Colors.black87
                                        : Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.5, color: const Color(0xFFC2C2C2))),
                child: const Center(
                  child: Icon(
                    Icons.mic,
                    size: 28,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
