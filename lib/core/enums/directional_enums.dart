enum DirectionalType { start, end, top, bottom }

extension DirectionalTypeExtension on DirectionalType {
  bool get isStart => this == DirectionalType.start;
  bool get isEnd => this == DirectionalType.end;
  bool get isTop => this == DirectionalType.top;
  bool get isBottom => this == DirectionalType.bottom;
}