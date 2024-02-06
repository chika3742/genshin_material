import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "text_style_parser.freezed.dart";

const _markers = <ModifierMarker>[
  ModifierMarker("**", FragmentType.boldText),
  ModifierMarker("~~", FragmentType.strikethroughText),
];

List<Fragment> parseStyledText(String input) {
  var remaining = input;
  final fragments = FragmentList();

  // forward until string gets empty
  while (remaining.isNotEmpty) {
    // escaping character
    if (remaining.characters.first == "\\") {
      fragments.putChar(remaining.characters.elementAt(1));
      remaining = remaining.substring(2);
      continue;
    }

    // if remaining string starts with any of markers
    final foundMarker =
        _markers.firstWhereOrNull((e) => remaining.startsWith(e.marker));
    if (foundMarker != null) {
      // remove marker part from string
      remaining = remaining.replaceFirst(foundMarker.marker, "");

      if (fragments.currentFragmentType != foundMarker.type) {
        fragments.openTag(foundMarker.type);
      } else {
        fragments.closeTag();
      }
    } else {
      fragments.putChar(remaining.characters.first);
      // forward string cursor
      remaining = remaining.substring(1);
    }
  }

  return fragments.toFreezed();
}

class FragmentList {
  final _list = <ParsingFragment>[];

  FragmentType? get currentFragmentType => _list.lastOrNull?.type;

  /// Puts a char to the last fragment of list.
  void putChar(String char) {
    if (char.length >= 2) {
      throw "Cannot put more than 1 char at the same time";
    }

    if (_list.isEmpty) {
      _list.add(ParsingFragment(FragmentType.text));
    }
    _list.last.text += char;
  }

  /// Opens tag and add new fragment.
  void openTag(FragmentType type) {
    _list.add(ParsingFragment(type));
  }

  /// Closes tag and put back to the previous tag.
  void closeTag() {
    _list.add(ParsingFragment(FragmentType.text));
  }

  List<Fragment> toFreezed() {
    return _list.map((e) {
      return Fragment(
        type: e.type,
        text: e.text,
      );
    }).toList();
  }
}

class ModifierMarker {
  final String marker;
  final FragmentType type;

  const ModifierMarker(this.marker, this.type);
}

enum FragmentType {
  text,
  boldText,
  strikethroughText,
}

class ParsingFragment {
  final FragmentType type;
  String text = "";

  ParsingFragment(this.type);
}

@Freezed(copyWith: false)
class Fragment with _$Fragment {
  const factory Fragment({
    required FragmentType type,
    required String text,
  }) = _Fragment;
}
