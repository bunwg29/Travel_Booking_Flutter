enum Enumstatusbook { WAIT, COMFIRMED, CANCELLED }

Enumstatusbook? enumFromString(String value) {
  try {
    return Enumstatusbook.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}
