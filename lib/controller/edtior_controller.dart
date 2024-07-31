import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextController extends GetxController {
  var fontFamily = 'Arial'.obs;
  var fontSize = 20.0.obs;
  var textColor = Colors.black.obs;
  var text = 'Sample Text'.obs;
  var textPosition = const Offset(10, 10).obs; // Initial position of the text
  var isBold = false.obs; // Track bold text

  // Stacks for history management
  final _undoHistory = <_TextState>[].obs;
  final _redoHistory = <_TextState>[].obs;
  final _historyIndex = (-1).obs;

  void setFontFamily(String newFont) {
    _saveState();
    fontFamily.value = newFont;
  }

  void setFontSize(double newSize) {
    _saveState();
    fontSize.value = newSize;
  }

  void setTextColor(Color newColor) {
    _saveState();
    textColor.value = newColor;
  }

  void setText(String newText) {
    _saveState();
    text.value = newText;
  }

  void setTextPosition(Offset newPosition) {
    _saveState();
    textPosition.value = newPosition;
  }

  void toggleBold() {
    _saveState();
    isBold.value = !isBold.value;
  }

  // Save the current state into the undo stack
  void _saveState() {
    if (_historyIndex.value < _undoHistory.length - 1) {
      // Discard any redo states if we are in the middle of the history
      _redoHistory.clear();
    }
    _undoHistory.add(_TextState(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      textColor: textColor.value,
      text: text.value,
      textPosition: textPosition.value,
      isBold: isBold.value,
    ));
    _historyIndex.value++;
  }

  // Undo the last action
  void undo() {
    if (_historyIndex.value >= 0) {
      final state = _undoHistory[_historyIndex.value];
      _redoHistory.add(_TextState(
        fontFamily: fontFamily.value,
        fontSize: fontSize.value,
        textColor: textColor.value,
        text: text.value,
        textPosition: textPosition.value,
        isBold: isBold.value,
      ));
      fontFamily.value = state.fontFamily;
      fontSize.value = state.fontSize;
      textColor.value = state.textColor;
      text.value = state.text;
      textPosition.value = state.textPosition;
      isBold.value = state.isBold;
      _historyIndex.value--;
    }
  }

  // Redo the last undone action
  void redo() {
    if (_redoHistory.isNotEmpty) {
      final state = _redoHistory.removeLast();
      _undoHistory.add(_TextState(
        fontFamily: fontFamily.value,
        fontSize: fontSize.value,
        textColor: textColor.value,
        text: text.value,
        textPosition: textPosition.value,
        isBold: isBold.value,
      ));
      fontFamily.value = state.fontFamily;
      fontSize.value = state.fontSize;
      textColor.value = state.textColor;
      text.value = state.text;
      textPosition.value = state.textPosition;
      isBold.value = state.isBold;
      _historyIndex.value++;
    }
  }
}

class _TextState {
  final String fontFamily;
  final double fontSize;
  final Color textColor;
  final String text;
  final Offset textPosition;
  final bool isBold; // Track bold state
  _TextState({
    required this.fontFamily,
    required this.fontSize,
    required this.textColor,
    required this.text,
    required this.textPosition,
    required this.isBold,
  });
}
