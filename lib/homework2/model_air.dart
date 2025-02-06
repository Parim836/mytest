class AirQuality {
  final String city;
  final int aqi;
  final double temperature;

  AirQuality(
      {required this.city, required this.aqi, required this.temperature});

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      city: json['data']['city']['name'],
      aqi: json['data']['aqi'],
      temperature: json['data']['iaqi']['t']['v'].toDouble(),
    );
  }
}
