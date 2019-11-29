/// Normalizes [value] from range [min] - [max] to 0.0 - 1.0 range.
double normalizeValue(num value, num min, num max) =>
    (value - min) / (max - min);
