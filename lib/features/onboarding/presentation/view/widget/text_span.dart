import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';

List<TextSpan> buildTextSpans(String text, String highlightWord) {
  List<TextSpan> spans = [];
  final parts = text.split(highlightWord); // Split text by the highlight word

  for (int i = 0; i < parts.length; i++) {
    spans.add(TextSpan(text: parts[i])); // Add non-highlighted part
    if (i < parts.length - 1) {
      spans.add(TextSpan(
        text: highlightWord, // Add highlighted word
        style: const TextStyle(
            color: kPurpleColor,
            fontWeight: FontWeight.w600), // Highlight style
      ));
    }
  }
  return spans;
}
