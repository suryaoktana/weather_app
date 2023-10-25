enum WeatherType {
  metric('Metric (C)'),
  imperial('Imperial (F)');

  final String description;

  const WeatherType(this.description);
}
