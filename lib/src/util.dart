/// Normalizes [value] from range [min] - [max] to 0.0 - 1.0 range.
double normalizeValue(num value, num min, num max) {
  if (min == max) return 0.0;
  return ((value - min) / (max - min)).clamp(0.0, 1.0);
}
