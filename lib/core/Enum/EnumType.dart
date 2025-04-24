enum Enumtype { TRAVEL, CLIMP, SWING, CHILL }

Enumtype? enumFromString(String value) {
  try {
    return Enumtype.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}
