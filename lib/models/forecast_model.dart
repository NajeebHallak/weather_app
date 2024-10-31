class ForecastModel {
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String forecastCondition;
  final String cityName;
  ForecastModel({
    required this.cityName,
    required this.forecastCondition,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });
//DateTime.parse(json["current"]["last_updated"])
  factory ForecastModel.fromJson(json, int index) {
    return ForecastModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["forecast"]["forecastday"][index]["date"]),
      image: json["forecast"]["forecastday"][index]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][index]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][index]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][index]["day"]["mintemp_c"],
      forecastCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
