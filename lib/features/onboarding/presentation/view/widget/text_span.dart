import 'package:flutter/material.dart';

List<TextSpan> buildTextSpans(String text, String highlightWord, context) {
  List<TextSpan> spans = [];
  final parts = text.split(highlightWord); // Split text by the highlight word

  for (int i = 0; i < parts.length; i++) {
    spans.add(TextSpan(text: parts[i])); // Add non-highlighted part
    if (i < parts.length - 1) {
      spans.add(TextSpan(
        text: highlightWord, // Add highlighted word
        style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.w600), // Highlight style
      ));
    }
  }
  return spans;
}
