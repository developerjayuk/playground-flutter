class Wurdle {
  String letter;
  bool isInTarget;
  bool isNotInTarget;

  Wurdle({
    required this.letter,
    this.isInTarget = false,
    this.isNotInTarget = false,
  });
}
