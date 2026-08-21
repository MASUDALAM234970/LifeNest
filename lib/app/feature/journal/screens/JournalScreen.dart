import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

import '../../../constant/app_text_style.dart';
import '../../home/screens/CustomBottomNavBar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final ScribbleNotifier _scribbleNotifier = ScribbleNotifier();


  Color selectedColor = Colors.black;


  // STROKE WIDTH

  double strokeWidth = 4;


  // SELECTED TOOL

  String selectedTool = "Pen";

  @override
  void initState() {
    super.initState();

    _scribbleNotifier.setColor(Colors.black);
    _scribbleNotifier.setStrokeWidth(strokeWidth);
  }

  @override
  void dispose() {
    _scribbleNotifier.dispose();
    super.dispose();
  }


  // APPLY CURRENT TOOL


  void applyCurrentTool() {
    if (selectedTool == "Pen") {
      _scribbleNotifier.setStrokeWidth(4);
      _scribbleNotifier.setColor(selectedColor);
    } else if (selectedTool == "Brush") {
      _scribbleNotifier.setStrokeWidth(10);
      _scribbleNotifier.setColor(selectedColor);
    } else if (selectedTool == "Marker") {
      _scribbleNotifier.setStrokeWidth(18);
      _scribbleNotifier.setColor(selectedColor.withOpacity(0.35));
    } else if (selectedTool == "Eraser") {
      _scribbleNotifier.setEraser();
    }
  }

  // ============================================================
  // CHANGE COLOR
  // ============================================================

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;

      // Color select করলে Eraser থেকে Pen-এ ফিরে যাবে
      if (selectedTool == "Eraser") {
        selectedTool = "Pen";
      }
    });

    applyCurrentTool();
  }

  // ============================================================
  // PEN
  // ============================================================

  void selectPen() {
    setState(() {
      selectedTool = "Pen";
    });

    _scribbleNotifier.setStrokeWidth(4);
    _scribbleNotifier.setColor(selectedColor);
  }

  // ============================================================
  // BRUSH
  // ============================================================

  void selectBrush() {
    setState(() {
      selectedTool = "Brush";
    });

    _scribbleNotifier.setStrokeWidth(10);
    _scribbleNotifier.setColor(selectedColor);
  }

  // ============================================================
  // MARKER
  // ============================================================

  void selectMarker() {
    setState(() {
      selectedTool = "Marker";
    });

    _scribbleNotifier.setStrokeWidth(18);

    _scribbleNotifier.setColor(selectedColor.withOpacity(0.35));
  }

  // ============================================================
  // ERASER
  // ============================================================

  void selectEraser() {
    setState(() {
      selectedTool = "Eraser";
    });

    _scribbleNotifier.setEraser();
  }

  // ============================================================
  // COLOR DOT
  // ============================================================

  Widget colorDot(Color color) {
    final bool selected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        changeColor(color);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: selected ? 30 : 25,
        height: selected ? 30 : 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selected ? const Color(0xFF2A2D93) : Colors.transparent,
            width: 3,
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: selected
            ? const Icon(Icons.check, color: Colors.white, size: 10)
            : null,
      ),
    );
  }

  // ============================================================
  // TOOL BUTTON
  // ============================================================

  Widget toolButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final bool isSelected = selectedTool == title;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2A2D93)
                      : const Color(0xFF2A2D93).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF2A2D93)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xFF2A2D93),
                  size: 25,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? const Color(0xFF2A2D93) : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // UNDO BUTTON
  // ============================================================

  Widget actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2D93).withOpacity(0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: iconColor ?? const Color(0xFF2A2D93),
                size: 20,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Drawing", style: AppTextStyle.mango70018cur),
      ),

      body: Container(
        //  color: Color(0xFFF5F5F5),
        child: Column(
          children: [

            Expanded(
              child: Container(
                // color: Color(0xFFF5F5F5),
                margin: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF2A2D93), width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                       color: Color(0xFFF5F5F5),

                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,

                child: Scribble(notifier: _scribbleNotifier, drawPen: true),
              ),
            ),

            // ========================================================
            // TOOL PANEL
            // ========================================================
          SizedBox(height: 00,),
            Container(
              width: 350,
              height: 280,
              padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
              decoration: const BoxDecoration(
                color: Color(0xffCDB4DB),

              ),

              child: Column(
                children: [
                  // ==================================================
                  // COLORS
                  // ==================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      colorDot(Colors.black),
                      colorDot(Colors.red),
                      colorDot(Colors.blue),
                      colorDot(Colors.green),
                      colorDot(Colors.orange),
                      colorDot(Colors.purple),
                    ],
                  ),

                  const SizedBox(height: 2),

                  // ==================================================
                  // STROKE WIDTH
                  // ==================================================
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 7, color: Colors.black54),

                      Expanded(
                        child: Slider(
                          min: 1,
                          max: 25,
                          value: strokeWidth,
                          activeColor: const Color(0xFF2A2D93),
                          inactiveColor: const Color(
                            0xFF2A2D93,
                          ).withOpacity(0.20),

                          onChanged: (value) {
                            setState(() {
                              strokeWidth = value;
                            });

                            // Slider change করলে selected tool-এর
                            // current width change হবে
                            if (selectedTool != "Eraser") {
                              _scribbleNotifier.setStrokeWidth(value);

                              if (selectedTool == "Marker") {
                                _scribbleNotifier.setColor(
                                  selectedColor.withOpacity(0.35),
                                );
                              } else {
                                _scribbleNotifier.setColor(selectedColor);
                              }
                            }
                          },
                        ),
                      ),

                      const Icon(Icons.circle, size: 22, color: Colors.black54),
                    ],
                  ),

                  const SizedBox(height: 2),

                  // ==================================================
                  // DRAWING TOOLS
                  // ==================================================
                  Row(
                    children: [
                      toolButton(
                        icon: Icons.edit,
                        title: "Pen",
                        onTap: selectPen,
                      ),

                      toolButton(
                        icon: Icons.brush,
                        title: "Brush",
                        onTap: selectBrush,
                      ),

                      toolButton(
                        icon: Icons.highlight,
                        title: "Marker",
                        onTap: selectMarker,
                      ),

                      toolButton(
                        icon: Icons.auto_fix_high,
                        title: "Eraser",
                        onTap: selectEraser,
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // ==================================================
                  // UNDO / REDO / CLEAR
                  // ==================================================
                  Row(
                    children: [
                      actionButton(
                        icon: Icons.undo,
                        title: "Undo",
                        onTap: () {
                          _scribbleNotifier.undo();
                        },
                      ),

                      actionButton(
                        icon: Icons.redo,
                        title: "Redo",
                        onTap: () {
                          _scribbleNotifier.redo();
                        },
                      ),

                      actionButton(
                        icon: Icons.delete_outline,
                        title: "Clear",
                        iconColor: Colors.redAccent,
                        onTap: () {
                          _scribbleNotifier.clear();
                        },
                      ),

                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // BOTTOM NAVIGATION
      // ============================================================
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
